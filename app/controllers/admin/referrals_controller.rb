class Admin::ReferralsController < ApplicationController
  before_action :authorize_admin

  def index
    render template: "admin/referrals"
  end

  private

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end

end