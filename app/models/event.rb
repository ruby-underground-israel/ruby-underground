class Event < ActiveRecord::Base
  attr_accessible :description, :lat, :lon, :name, :time, :url

  def self.next
    order("time asc").first
  end
end
