class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:main]
  def main
    @jobs = Job.all.order(:updated_at).first(4)
    render template: "pages/main"
  end

  def dashboard
    @user = current_user
    if @user.keywords.present?
      @jobs = Job.all.order(:updated_at).where((@user.keywords & [:keywords]).count >= 2 , :open => true).first(6)
    else
      @jobs = Job.all.order(:updated_at).where(:open => true).first(6)
    end
    @job_applications = JobApplication.order(:updated_at).where(:user_id => @user.id).first(6)
    @new_jobs = Job.where("created_at > ?", 1.week.ago).count
    @application_updates = JobApplication.where("updated_at > ?", @user.last_sign_in_at).count
  end

  def show
    if valid_page?
      render template: "pages/static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/static_pages/#{params[:page]}.html.erb"))
  end
end