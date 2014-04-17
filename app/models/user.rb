class User < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                           	with: /a-zA-Z0-9_-/,
                           	message: 'profile should be in the right format.'
                           }

  def full_name
   	first_name + " " + last_name
  end
end
