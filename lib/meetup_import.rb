class MeetupImport
  def initialize(api_key)
    RubyUndergroundMeetupEvent.api_key = api_key
  end

  def go!
    RubyUndergroundMeetupEvent.all.each do |meetup_event|
      event = Event.find_or_create_by_meetup_id(meetup_event.id)
      %w[name description event_url time].each do |attribute|
        event.update_attribute(attribute, meetup_event.send(attribute))
      end

      %w[lat lon].each do |attribute|
        event.update_attribute(attribute, meetup_event.venue.send(attribute))
      end
    end
  end
end
