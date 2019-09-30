class UserMailer < ApplicationMailer

  default from: 'members@mobilise.digital'

  def welcome_email
    @user = params[:user]
    @url  = 'https://vanspots.uk/users/sign_in'
    mail(to: @user.email,from: 'welcome@mobilise.digital', bcc:'phil.reynolds@mobilise.cloud', subject: 'Welcome to Mobilise Digital')
  end
end