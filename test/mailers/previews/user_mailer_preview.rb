class DeviseMailerPreview < ActionMailer::Preview
  ### Preview all emails at http://localhost:3000/rails/mailers

  # def welcome_email
  #   UserMailer.with(user: User.first).welcome_email
  # end

  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, "faketoken")
  end

  def reset_password_instructions
    MyMailer.reset_password_instructions(User.first, "faketoken", {})
  end
end