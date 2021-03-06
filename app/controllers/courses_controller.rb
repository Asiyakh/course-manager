class CoursesController < ApplicationController
    before_action :authenticate_account!, except: [ :index, :show ]
    before_action :set_course, only: [:show]

    def index
        @courses = Course.all
    end

    def show
        @posts = @course.posts.limit(20).sort_by{ |p| p.score}.reverse
        @subscriber_count = @course.subscribers.count

        @is_subscribed = account_signed_in? ? Subscription.where(course_id: @course.id, account_id: current_account.id).any? : false
        @subscription = Subscription.new
    end
 
    def create
        @course = Course.new course_values
        @course.account_id = current_account.id

        if @course.save
            redirect_to courses_path
        else
            render :new
        end
    end

    def new
        @course = Course.new
    end


    private

    def set_course
        @course = Course.find(params[:id])
    end
    
    def course_values
        params.require(:course).permit(:name, :url, :summary, :rules)
    end

end