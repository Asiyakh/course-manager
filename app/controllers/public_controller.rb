class PublicController < ApplicationController

    def index
        @courses = Course.all.limit(5)
        @posts = Post.limit(20).sort_by{ |p| p.score}.reverse
    end

    def profile
        @profile = Account.find_by_utorid params[:utorid]
        @posts = @profile.posts
    end

end    