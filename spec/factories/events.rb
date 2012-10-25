# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Monthly Meetup"
    description "We will discuss things."
    url "http://meetup.rubyunderground.co.il/events/79894502/"
    time 3.weeks.from_now
    lat "34.822259043034705"
    lon "35.9831428527832"
  end
end
