class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'mailer' # to make sure that mailer uses the devise views


  default from: 'Mobilise Digital <members@mobilise.digital>'
  layout 'mailer'

end