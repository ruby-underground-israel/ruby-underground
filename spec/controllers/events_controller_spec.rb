require 'spec_helper'

describe EventsController do
  describe "GET index" do
    context "via normal request" do
      it "assigns upcoming events as @events"
      it "does not assign past events in @events" 
    end

    context "via AJAX" do
      it "assigns only the next event as @events"
    end
  end

end
