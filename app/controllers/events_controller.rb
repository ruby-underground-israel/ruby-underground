class EventsController < ApplicationController
  def index
    if request.xhr?
      @event = Event.next
    else
      @events = Event.upcoming
    end
  end
end
