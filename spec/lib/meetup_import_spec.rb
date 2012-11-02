require 'spec_helper'

describe MeetupImport do
  subject { MeetupImport.new("meetup_api_key") }

  let(:values) {{ name: "Blocks in-depth",
                  description: "A fun meetup",
                  venue: OpenStruct.new(lat: 32.070127, lon: 34.793795),
                  time: 1353944700000,
                  event_url: "http://meetup.rubyunderground.co.il/events/79894502/"
  }}

  RSpec::Matchers.define :contain_correct_meetup_values do
    match do |actual|
      actual.name.should == "Blocks in-depth"
      actual.description.should == "A fun meetup"
      actual.lat.should == "32.070127"
      actual.lon.should == "34.793795"
      actual.time.should == 1353944700000
      actual.event_url.should == "http://meetup.rubyunderground.co.il/events/79894502/"
    end
  end

  describe "#go" do
    context "for new meetups" do
      before do
        RubyUndergroundMeetupEvent.stub(:all).and_return([RubyUndergroundMeetupEvent.new(values)])
      end

      it "creates events" do
        expect { subject.go! }.to change(Event, :count).by(1)
      end

      it "sets correct values" do
        subject.go!
        Event.first.should contain_correct_meetup_values
      end
    end

    context "for existing meetups" do
      before do
        existing_event = FactoryGirl.create :event
        RubyUndergroundMeetupEvent.stub(:all).and_return([RubyUndergroundMeetupEvent.new(values.merge(id: existing_event.meetup_id))])
      end

      it "doesn't create events" do
        expect { subject.go! }.to_not change(Event, :count)
      end

      it "sets correct values" do
        subject.go!
        Event.first.should contain_correct_meetup_values
      end
    end
  end
end
