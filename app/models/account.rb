class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, :through => :subscriptions
  has_many :posts
  has_many :comments
  has_many :votes

  validates_presence_of :first_name, :last_name, :utorid

  def full_name
    "#{first_name} #{last_name}"
  end 

  def liked_post_ids
    self.votes.where(like: true).pluck(:post_id)
  end
  
  def disliked_post_ids
    self.votes.where(like: false).pluck(:post_id)
  end

end
