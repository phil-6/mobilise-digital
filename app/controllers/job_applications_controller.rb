class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: :create

  def index
    @job_applications = JobApplication.where(:user_id => current_user.id)
  end

  def new
    if JobApplication.exists?(user_id: current_user.id, job_id: params[:job_id])
      flash[:error] = 'You have already applied for this job'
      redirect_to @job
    end
    @job_application = JobApplication.new
  end

  # POST /job/:job_id/applications
  def create
    if current_user.job_applications.create!(rating_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  private

  def set_job
      #@job = Job.find(@job_applications.job_id) if @job_applications
      @job = Job.find(params[:job_id])
  end



end