class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:create]


  private

  def set_job
    @job = Job.find(params[:id])
  end

end