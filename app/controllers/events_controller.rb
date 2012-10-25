class EventsController < ApplicationController
  def index
    if request.xhr?
      redirect_to Event.next
    else
      @events = Event.upcoming
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
