class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:main, :map]
  def main
    render template: "pages/main"
  end

  def dashboard
    @user = current_user
    if @user.keywords.present?
      @jobs = Job.all.order(:updated_at).where((@user.keywords & [:keywords]).count >= 2 , :open => true).first(6)
    else
      @jobs = Job.all.order(:updated_at).where(:open => true).first(6)
    end
    @job_applications = JobApplication.order(:updated_at).where(:user_id => current_user.id).first(6)
  end

  def welcome_pack
    render template: "pages/welcome_pack"
  end

  def gdpr
    render template: "pages/gdpr_agreement"
  end

  def email_terms
    render template: "pages/email_terms"
  end

  def website_terms
    render template: "pages/website_terms"
  end

end