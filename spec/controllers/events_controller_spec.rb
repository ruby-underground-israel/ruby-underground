require 'spec_helper'

describe EventsController do
  describe "GET index" do
    #let(:next_event) { FactoryGirl.create :event, time: 1.month.from_now }
    before do
      @next_event = FactoryGirl.create :event, time: 1.month.from_now
    end

    context "via normal request" do
      it "assigns upcoming events as @events" do
        get :index
        assigns(:events).should eq([@next_event])
      end

      it "does not assign past events in @events" do
        past_event = FactoryGirl.create :event, time: 1.month.ago 
        get :index
        assigns(:events).should_not be_include(past_event)
      end
    end

    context "via AJAX" do
      it "assigns the next event as @event" do
        xhr :get, :index
        assigns(:event).should eq(@next_event)
      end

      it "does not assign more than one upcoming event in @event" do
        future_event = FactoryGirl.create :event, time: 2.months.from_now
        xhr :get, :index
        assigns(:event).should_not be_a(Enumerable)
      end
    end
  end

end
