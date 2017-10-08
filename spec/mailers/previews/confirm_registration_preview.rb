# Preview all emails at http://localhost:3000/rails/mailers/confirm_registration
class ConfirmRegistrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_registration/new_user
  def new_user
    ConfirmRegistrationMailer.new_user
  end

end
