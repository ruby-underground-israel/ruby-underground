class RubyUndergroundMeetupEvent < OpenStruct
  class << self
    attr_accessor :api_key

    def all
      meetup_events.map { |event_json| to_openstruct(event_json) }
    end

    private

    def events_url
      "https://api.meetup.com/2/events\?key\=#{@api_key}\&sign\=true\&group_id\=1790364"
    end 

    def meetup_events
      body = HTTParty.get(events_url).body
      JSON.parse(body)["results"]
    end

    def to_openstruct(hash)
      RubyUndergroundMeetupEvent.new.tap do |struct|
        hash.each do |k, v|
          v = to_openstruct(v) if v.is_a?(Hash)
          struct.send("#{k}=", v)
        end
      end
    end
  end
end
