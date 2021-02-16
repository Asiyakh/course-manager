class PostsController < ApplicationController
    before_action :authenticate_account!, except: [ :index, :show ]
    before_action :set_post, only: [:show]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @course = Course.find(params[:course_id])
        @post = Post.new
    end


    def create
        @post = Post.new post_values
        @post.account_id = current_account.id
        @post.course_id = params[:course_id]

        if @post.save
            redirect_to course_path(@post.course_id)
        else
            @course = Course.find(params[:course_id])
            render :new
        end
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_values
        params.require(:post).permit(:title, :body)
    end

end