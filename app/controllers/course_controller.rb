class CoursesController < ApplicationController
    before_authentication :authenticate_account!, except: [ :show ]


    def index
        @courses = Courses.all
    end

    def show
    end

    def create
    end

    def new
    end

end