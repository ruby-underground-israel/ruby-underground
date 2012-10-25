class HomeController < ApplicationController
  def index
    @next_event = Event.next
  end
end
