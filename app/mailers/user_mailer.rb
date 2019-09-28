class UserMailer < ApplicationMailer
  default from: 'my_confidence@example.com'

  def user_mail(user)
    @user = user

    mail(to: @user.email, subject: '新規登録ありがとうございます')
  end
end
