class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]
  has_many :reservations

  def full_name
    "#{first_name} #{last_name}"
  end


  after_create :welcome_message


private

  def welcome_message
    UserMailer.welcome_email(self).deliver
  end

end
