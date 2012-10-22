require 'spec_helper'

describe JobsController do
  describe "GET index" do
    it "assigns all jobs as @jobs" do
      job = FactoryGirl.create :job
      get :index
      assigns(:jobs).should eq([job])
    end
  end

  describe "GET show" do
    it "assigns the requested job as @job" do
      job = FactoryGirl.create :job
      get :show, {:id => job.to_param}
      assigns(:job).should eq(job)
    end
  end

  describe "GET new" do
    it "assigns a new job as @job" do
      get :new, {}
      assigns(:job).should be_a_new(Job)
    end
  end
end
