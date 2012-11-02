class Event < ActiveRecord::Base
  attr_accessible :description, :lat, :lon, :name, :time, :event_url, :meetup_id
  scope :upcoming, -> { where("time > ?", Time.now) }
  default_scope order('time')

  def self.next
    upcoming.first
  end
end
