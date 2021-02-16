class Course < ApplicationRecord
    belongs_to :account
    validates_presence_of :name, :url, :rules
    has_many :posts
    has_many :subscriptions
    has_many :subscribers, :through => :subscriptions, :source => :account

end