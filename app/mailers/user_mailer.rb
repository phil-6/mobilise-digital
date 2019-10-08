class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'mailer' # to make sure that mailer uses the devise views


  default from: 'Mobilise Digital <members@mobilise.digital>'
  layout 'mailer'


  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'https://mobilise.digital/login'
  #   mail(to: @user.email,from: 'Mobilise Digital <members@mobilise.digital>', bcc:'phil.reynolds@mobilise.cloud', subject: 'Welcome to Mobilise Digital')
  # end
end