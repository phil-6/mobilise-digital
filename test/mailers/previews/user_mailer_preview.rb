class DeviseMailerPreview < ActionMailer::Preview
  # def welcome_email
  #   UserMailer.with(user: User.first).welcome_email
  # end
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, "faketoken")
  end
end