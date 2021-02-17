class PostsController < ApplicationController
    before_action :authenticate_account!, except: [ :index, :show ]
    before_action :set_post, only: [:show]
    before_action :auth_subscriber, only:[:new]

    def index
        @posts = Post.all
    end

    def show
        @comment = Comment.new
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
        @post = Post.includes(:comments).find(params[:id])
    end
    
    def auth_subscriber
        unless Subscription.where(course_id: params[:course_id], account_id: current_account.id).any?
            redirect_to root_path, flash: { danger: "You must be signed in to view this page." }
        end
    end

    def post_values
        params.require(:post).permit(:title, :body)
    end

end