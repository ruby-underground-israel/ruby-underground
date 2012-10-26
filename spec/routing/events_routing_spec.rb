require "spec_helper"

describe EventsController do
  describe "routing" do
    it "routes to #index" do
      get("/events").should route_to("events#index")
    end

    it "routes to #show" do
      get("/events/1").should route_to("events#show", :id => "1")
    end
  end
end
