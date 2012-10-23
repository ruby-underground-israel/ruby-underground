require 'spec_helper'

describe JobsController do
  def valid_attributes
    FactoryGirl.attributes_for(:job)
  end

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

  describe "POST create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, {:job => valid_attributes}
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, {:job => valid_attributes}
        assigns(:job).should be_a(Job)
        assigns(:job).should be_persisted
      end

      it "redirects to the created job" do
        post :create, {:job => valid_attributes}
        response.should redirect_to(Job.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        # Trigger the behavior that occurs when invalid params are submitted
        Job.any_instance.stub(:save).and_return(false)
        post :create, {:job => {}}
        assigns(:job).should be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Job.any_instance.stub(:save).and_return(false)
        post :create, {:job => {}}
        response.should render_template("new")
      end
    end
  end
end
