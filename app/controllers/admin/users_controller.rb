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
        @user.email.blank?,
        @user.first_name.blank?,
        @user.last_name.blank?,
        @user.contact_phone.blank?,
        @user.address_company.blank?,
        @user.address_1.blank?,
        @user.address_2.blank?,
        @user.address_town.blank?,
        @user.address_county.blank?,
        @user.address_postcode.blank?,
        @user.emergency_name.blank?,
        @user.emergency_relationship.blank?,
        @user.emergency_number.blank?,
        @user.emergency_email.blank?,
        @user.gdpr_agreement,
        @user.job_email_agreement.blank?,
        @user.marketing_email_agreement.blank?,
        @user.website_terms_agreement,
        @user.cv_uploaded,
        @user.sa_uploaded
    ]
    @user.profile_completion = (((fields_array.count(false)).to_f/(fields_array.count).to_f).round(2)) * 100
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