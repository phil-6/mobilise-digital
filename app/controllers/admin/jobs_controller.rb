class Admin::JobsController < ApplicationController
  before_action :authorize_admin
  before_action :set_job, except: [:index, :new, :create]

  def index
    render template: "admin/jobs"
  end

  def show
    @job
    render template: "admin/manage_job"
  end

  def new
    @job = Job.new
    render template: "admin/create_job"
  end

  def create
    if @job = Job.create!(job_params)
      redirect_to :admin_jobs
    else
      render 'new'
    end
  end

  def update
    if @job.update(job_params)
      flash[:notice] = 'Job Updated Successfully'
    else
      flash[:alert] = 'Something Broke'
    end
    redirect_to :admin_job
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
    params.require(:job).permit(:name,
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
                                :requirements)
  end

end
