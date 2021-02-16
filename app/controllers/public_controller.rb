class PublicController < ApplicationController

    def index
        @courses = Course.all.limit(5)
        @posts = Post.order(id: :desc).limit(20)
    end

    def profile
        @profile = Account.find_by_utorid params[:utorid]
        @posts = @profile.posts
    end

end    