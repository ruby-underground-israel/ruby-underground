class JobsController < ApplicationController
  def index
    @jobs = Job.published

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end
end
