require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns the next event as @next_event" do
      event = FactoryGirl.create :event
      get :index
      assigns(:next_event).should == event
    end
  end

end
