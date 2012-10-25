require 'spec_helper'

describe EventsController do
  describe "GET index" do
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
      it "redirects to show the next event" do
        xhr :get, :index
        response.should redirect_to(@next_event)
      end
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = FactoryGirl.create :event
      get :show, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end
end
