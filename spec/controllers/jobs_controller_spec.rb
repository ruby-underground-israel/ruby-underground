require 'spec_helper'

describe JobsController do
  describe "GET index" do
    it "assigns published jobs as @jobs" do
      job = FactoryGirl.create :job, published: true
      get :index
      assigns(:jobs).should eq([job])
    end

    it "does not assign unpublished jobs in @jobs" do
      job = FactoryGirl.create :job, published: false
      get :index
      assigns(:jobs).should_not be_include(job)
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
