# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    fields_array = [
        current_user.email.blank?,
        current_user.first_name.blank?,
        current_user.last_name.blank?,
        current_user.contact_phone.blank?,
        current_user.address_company.blank?,
        current_user.address_1.blank?,
        current_user.address_2.blank?,
        current_user.address_town.blank?,
        current_user.address_county.blank?,
        current_user.address_postcode.blank?,
        current_user.emergency_name.blank?,
        current_user.emergency_relationship.blank?,
        current_user.emergency_number.blank?,
        current_user.emergency_email.blank?,
        current_user.terms_agreement.blank?,
        current_user.gdpr_agreement.blank?,
        current_user.job_email_agreement.blank?,
        current_user.marketing_email_agreement.blank?,
        current_user.cv_uploaded.blank?,
        current_user.sa_uploaded.blank?
    ]
    current_user.profile_completion = (((fields_array.count(false)).to_f/(fields_array.count).to_f).round(2)) * 100
    current_user.save
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    '/error'
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
    '/confirmation/pending'
  end

  # The path used after update.
  def after_update_path_for(resource)
    super (resource)
    '/profile'
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
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
                                 :gdpr_agreement,
                                 :job_email_agreement,
                                 :marketing_email_agreement,
                                 :website_terms_agreement,
                                 :contractor_terms_agreement,
                                 :verified)
  end
end
