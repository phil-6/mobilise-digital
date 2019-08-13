class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: :create


  # GET /applications or /job/:job_id/applications
  def index
    if params[:job_id]
      @job_applications = JobApplication.where(:user_id => current_user.id, :job_id => params[:job_id])
      if @job_applications.empty?
        redirect_to '/jobs/' + params[:job_id] + '/applications/new'
        flash[:alert] = 'You have not applied for this job yet'
      end
    else
      @job_applications = JobApplication.where(:user_id => current_user.id)
    end
  end

  # GET /job/:job_id/applications/new
  def new
    @job = Job.find(params[:job_id])
    if JobApplication.exists?(user_id: current_user.id, job_id: params[:job_id])
      flash[:alert] = 'You have already applied for this job'
      redirect_to '/jobs/' + params[:job_id]
    end
    @job_application = JobApplication.new
  end

  # POST /job/:job_id/applications
  def create
    if current_user.job_applications.create!(job_application_params)
      redirect_to '/jobs/' + params[:job_id]
    else
      render 'edit'
    end
  end

  private

  def set_job
      #@job = Job.find(@job_applications.job_id) if @job_applications
      @job = Job.find(params[:job_id])
  end

  def job_params
    # whitelist params
    params.require(:job).permit(:user_id,
                                :job_id,
                                :cover)
  end


end