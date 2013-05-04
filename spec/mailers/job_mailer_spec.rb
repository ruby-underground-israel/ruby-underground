require "spec_helper"

describe JobMailer do
  describe "#query_for_relevance" do
    let(:job) { FactoryGirl.create :job }
    let(:email) { JobMailer.query_for_relevance(job).deliver }

    before do
      @upcoming_event = FactoryGirl.create :event
    end

    it "sends an e-mail to the job's contact e-mail" do
      email.to.should == [job.contact_email]
    end

    it "mentions the job name in the subject" do
      email.subject.should include job.name
    end

    it "mentions the job name in the body" do
      email.body.should include job.name
    end

    it "notifies about the upcoming meetup" do
      email.body.should include @upcoming_event.time.strftime("%B %e, %Y")
    end
  end
end
