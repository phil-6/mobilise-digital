class Admin::UsersController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, except: :index

  def index
    render template: "admin/users"
  end

  def show
    @user
    @job_applications  = JobApplication.where(:user_id => @user.id)
    render template: "admin/manage_user"
  end

  def update
    @user.keywords = account_update_params[:keywords].split
    if @user.save
      flash[:notice] = 'User Updated Successfully'
    else
      flash[:alert] = ('Something went wrong: ' + @user.errors.full_messages.to_sentence)
    end
    redirect_to :admin_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin
    redirect_to(root_path) unless current_user && current_user.admin?
  end

  def account_update_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password,
                                 :contact_phone,
                                 :address_company,
                                 :address_1,
                                 :address_2,
                                 :address_town,
                                 :address_county,
                                 :address_postcode,
                                 :emergency_name,
                                 :emergency_relationship,
                                 :emergency_number,
                                 :emergency_email,
                                 :verified,
                                 :admin,
                                 :keywords,
                                 :secondary_keywords)
  end
end