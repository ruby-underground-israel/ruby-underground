require "spec_helper"

describe VideosController do
  describe "routing" do
    it "routes to #index" do
      get("/videos").should route_to("videos#index")
    end

    it "routes to #show" do
      get("/videos/1").should route_to("videos#show", :id => "1")
    end
  end
end
