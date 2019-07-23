class AdminController < ApplicationController

  before_action :authorize_admin
  before_action :set_user, only: :edit_user

  def users
    render template: "admin/users"
  end

  def edit_user
    @user
    render template: "admin/manage_user"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end
end