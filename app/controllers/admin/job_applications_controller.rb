class Admin::JobApplicationsController < ApplicationController
  before_action :authorize_admin
  before_action :set_application, except: [:index, :new, :create]

  # GET /admin/applications or /admin/jobs/:job_id/applications
  def index
    if params[:job_id]
      @job_applications = JobApplication.where(:job_id => params[:job_id])
      if @job_applications.empty?
        redirect_to '/admin/job_applications/'
        flash[:alert] = 'No one has applied for this job yet'
      else
        render template: "/admin/job_applications/"
      end
    else
      @job_applications = JobApplication.all
      render template: "/admin/job_applications/"
    end
  end

  def show
    @application
    render template: "admin/manage_job_application"
  end

  def update
    if @application.update(job_application_params)
      flash[:notice] = 'Application Updated Successfully'
    else
      flash[:alert] = 'Something Broke'
    end
    redirect_to :admin_job_application
  end

  private

  def set_application
    @application = JobApplication.find(params[:id])
  end

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end

  def job_application_params
    # whitelist params
    params.require(:job_application).permit(:status, :status_reason)
  end
end