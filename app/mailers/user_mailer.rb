class UserMailer < ActionMailer::Base
    default from: 'CHKTNDR@CHKNTNDR.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://aqueous-anchorage-2260.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to CHKTNDR')
  end
end
