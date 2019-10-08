class DeviseMailerPreview < ActionMailer::Preview
  ### Preview all emails at http://localhost:3000/rails/mailers

  # def welcome_email
  #   UserMailer.with(user: User.first).welcome_email
  # end

  def confirmation_instructions
    UserMailer.confirmation_instructions(User.first, "faketoken",)
  end

  def reset_password_instructions
    UserMailer.reset_password_instructions(User.first, "faketoken", {})
  end

  def password_change
    UserMailer.password_change(User.first, {})
  end

  def email_changed
    UserMailer.email_changed(User.first, {})
  end

end