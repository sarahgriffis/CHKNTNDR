class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

  #validates :id, presence: true
  validates_confirmation_of :password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :industry, presence: true
  validates :job_title, presence: true
  validates :home_city, presence: true


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
