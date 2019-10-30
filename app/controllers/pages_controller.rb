class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:main, :show]

  def main
    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to new_user_session_path
    end
  end

  def dashboard
    @user = current_user
    if @user.keywords.present?
      @jobs = Job.all.order(:updated_at).where((@user.keywords & [:keywords]).count >= 2 , :open => true).first(6)
    else
      @jobs = Job.all.order(:updated_at).where(:open => true).first(6)
    end
    @job_applications = JobApplication.order(:updated_at).where(:user_id => @user.id).where.not(:status => ["On Site", "Closed", "Failed"]).first(6)
    @new_jobs = Job.where("created_at > ?", 1.week.ago).count
    @application_updates = JobApplication.where("updated_at > ?", @user.last_sign_in_at).count
    @referrals = Referral.where(:user_id => @user.id).order(:updated_at)
  end

  def show
    if valid_page?
      if %w(gdpr_agreement email_terms website_terms).include?(params[:page])
        render template: "pages/static_pages/#{params[:page]}"
      else
        if !user_signed_in?
          flash[:alert] = 'You need to sign in or sign up before continuing'
          redirect_to new_user_session_path
        else
          render template: "pages/static_pages/#{params[:page]}"
        end
      end
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/static_pages/#{params[:page]}.html.erb"))
  end
end