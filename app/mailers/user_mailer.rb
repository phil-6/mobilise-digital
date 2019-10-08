class UserMailer < ApplicationMailer

  default from: 'Mobilise Digital <members@mobilise.digital>'
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    @url  = 'https://mobilise.digital/login'
    mail(to: @user.email,from: 'Mobilise Digital <members@mobilise.digital>', bcc:'phil.reynolds@mobilise.cloud', subject: 'Welcome to Mobilise Digital')
  end
end