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

  has_many :received_messages,
           :class_name => 'Message',
           :foreign_key => 'receiver_id'
        #   :conditions => ["messages.receiver_deleted = ?", false]
  has_many :sent_messages,
           :class_name => 'Message',
           :foreign_key => 'sender_id'
        #   :conditions => ["messages.receiver_deleted = ?", false]



  def full_name
    "#{first_name} #{last_name}"
  end


  after_create :welcome_message


  def unread_messages?
   unread_message_count > 0 ? true : false
  end

  # Returns the number of unread messages for this user
   def unread_message_count
     eval 'messages.count(:conditions => ["receiver_id = ? AND read_at IS NULL", self.sender_id])'
   end


private

  def welcome_message
    UserMailer.welcome_email(self).deliver
  end

end
