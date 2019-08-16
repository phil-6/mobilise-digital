class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:main, :map]
  def main
    render template: "pages/main"
  end

  def dashboard
    @user = current_user
    @jobs = Job.all.order(:updated_at).where((@user.keywords & [:keywords]).count >= 2 , :open => true).first(6)
    @job_applications = JobApplication.order(:updated_at).where(:user_id => current_user.id).first(6)
  end
end
