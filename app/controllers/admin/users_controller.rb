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

    attributes = account_update_params.clone
    attributes[:keywords] = account_update_params[:keywords].split
    profile_completion_calc
    if @user.update_attributes(attributes)
      flash[:notice] = 'User Updated Successfully'
    else
      flash[:alert] = ('Something went wrong: ' + @user.errors.full_messages.to_sentence)
    end

    redirect_to :admin_user
  end

  private

  def profile_completion_calc
    fields_array = [
        @user.email.present?,
        @user.first_name.present?,
        @user.last_name.present?,
        @user.contact_phone.present?,
        @user.address_company.present?,
        @user.address_1.present?,
        @user.address_2.present?,
        @user.address_town.present?,
        @user.address_county.present?,
        @user.address_postcode.present?,
        @user.emergency_name.present?,
        @user.emergency_relationship.present?,
        @user.emergency_number.present?,
        @user.emergency_email.present?,
        @user.cv_uploaded,
        @user.sa_uploaded
    ]
    @user.profile_completion = (((fields_array.count(true)).to_f/(fields_array.count).to_f).round(2)) * 100
  end

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
                                 :sa_uploaded,
                                 :cv_uploaded,
                                 :keywords,
                                 :secondary_keywords,
                                 :profile_completion)
  end
end