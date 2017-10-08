class ConfirmRegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_registration_mailer.new_user.subject
  #
  def new_user
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
