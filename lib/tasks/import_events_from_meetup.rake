namespace :ruby_underground do
  task :import_events_from_meetup => :environment do
    MeetupImport.new(ENV['MEETUP_API_KEY']).go!
  end
end
