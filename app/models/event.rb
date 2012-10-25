class Event < ActiveRecord::Base
  attr_accessible :description, :lat, :lon, :name, :time, :url
  scope :upcoming, -> { where("time > ?", Time.now) }

  def self.next
    upcoming.first
  end
end
