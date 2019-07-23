class AdminController < ApplicationController

  before_action :authorize_admin

  def users
    render template: "pages/admin/users"
  end

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end
end