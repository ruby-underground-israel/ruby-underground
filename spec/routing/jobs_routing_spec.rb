require "spec_helper"

describe JobsController do
  describe "routing" do
    it "routes to #index" do
      get("/jobs").should route_to("jobs#index")
    end

    it "routes to #new" do
      get("/jobs/new").should route_to("jobs#new")
    end

    it "routes to #show" do
      get("/jobs/1").should route_to("jobs#show", :id => "1")
    end
  end
end
