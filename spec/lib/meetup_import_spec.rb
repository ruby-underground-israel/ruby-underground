require 'spec_helper'

describe MeetupImport do
  it "creates events for new meetups" do
    expect {
      MeetupImport.new.go!
    }.to change(Event, :count).by(1)
  end

  xit "doesn't create events for existing meetups" do
    expect {
      MeetupImport.new.go!
    }.to change(Event, :count).by(0)
  end
end
