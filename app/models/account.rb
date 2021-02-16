class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, :through => :subscriptions
  has_many :posts

  validates_presence_of :first_name, :last_name, :utorid

  def full_name
    "#{first_name} #{last_name}"
  end 

end
