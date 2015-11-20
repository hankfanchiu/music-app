class UserMailer < ApplicationMailer
  def activation_email(user)
    @user = user
    @url = new_session_url

    mail(
      to: user.email,
      subject: "Welcome to Music App! Account activation required"
      )
  end
end
