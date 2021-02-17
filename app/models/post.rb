class Post < ApplicationRecord
    belongs_to :account
    belongs_to :course
    validates_presence_of :title, :body, :account, :course_id 
    has_many :comments

    def score 
        if self.like > 0 || self.dislike > 0
            self.like > 0 ? (self.like - self.dislike) : (self.dislike * -1)
        else
            0
        end

    end
end 