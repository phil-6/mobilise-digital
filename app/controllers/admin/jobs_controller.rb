class Admin::JobsController < ApplicationController
  before_action :authorize_admin
  before_action :set_job, except: [:index, :new, :create]

  def index
    render template: "admin/jobs"
  end

  def show
    @job
    @job_applications = JobApplication.where(:job_id => params[:id])
    render template: "admin/manage_job"
  end

  def new
    @job = Job.new
    render template: "admin/create_job"
  end

  def create
    @job = Job.new(job_params)
    @job.keywords = job_params[:keywords].split
    if @job.save
      redirect_to :admin_jobs
      flash[:notice] = 'Job Created Successfully'
    else
      render template: "admin/create_job"
      flash[:alert] = ('Something went wrong: ' + @job.errors.full_messages.to_sentence)
    end
  end

  def update
    attributes = job_params.clone
    attributes[:keywords] = job_params[:keywords].split
    if @job.update_attributes(attributes)
      flash[:notice] = 'Job Updated Successfully'
    else
      flash[:alert] = ('Something went wrong: ' + @job.errors.full_messages.to_sentence)
    end
    redirect_to :admin_job
  end

  def destroy
    @job.destroy
    redirect_to :admin_jobs
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end

  def job_params
    # whitelist params
    params.require(:job).permit(:title,
                                :description,
                                :published_date,
                                :latest_start_date,
                                :award_date,
                                :contract_length,
                                :day_rate,
                                :working_arrangements,
                                :address_company,
                                :address_1,
                                :address_2,
                                :address_town,
                                :address_county,
                                :address_postcode,
                                :team,
                                :requirements,
                                :open,
                                :keywords,
                                :web_address)
  end

end
