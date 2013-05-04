class JobMailer < ActionMailer::Base
  default from: "omer@rauchy.net"

  def query_for_relevance(job)
    @job = job
    @upcoming_event_time = Event.upcoming.first.time.strftime("%B %e, %Y")
    mail to: job.contact_email,
      subject: "Are You Still Looking for a #{job.name}?"
  end
end
