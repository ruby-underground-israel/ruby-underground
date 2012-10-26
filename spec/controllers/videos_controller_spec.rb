require 'spec_helper'

describe VideosController do
  describe "GET index" do
    it "assigns all videos as @videos" do
      video = FactoryGirl.create :video
      get :index
      assigns(:videos).should eq([video])
    end

    it "puts newest videos first" do
      old_video = FactoryGirl.create :video, created_at: 1.week.ago
      new_video = FactoryGirl.create :video, created_at: 1.days.ago
      get :index
      assigns(:videos).should eq([new_video, old_video])
    end
  end
end
