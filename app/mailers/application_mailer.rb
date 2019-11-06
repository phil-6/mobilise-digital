class ApplicationMailer < ActionMailer::Base
  default from: 'Mobilise Digital <info@mobilise.digital>'
  layout 'mailer'

  # Email to non-member
  def referral_email(referral_params, user)
    @user = user
    mail(to: referral_params[:email], subject: 'You\'ve been referred to Mobilise Digital')
  end

  # Confirmation email to current member
  # Not currently used
  def referral_confirmation_email

  end

  #Confirmation of signup to current member
  def referral_success_email(referral)
    @referral = referral
    mail(to: @referral.user.email, subject: 'Someone you referred has signed up to Mobilise Digital')
  end

  def job_application_created_email

  end

  def job_application_updated_email

  end




end
