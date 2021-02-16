class Post < ApplicationRecord
    belongs_to :account
    belongs_to :course
    validates_presence_of :title, :body, :account, :course_id 
end 