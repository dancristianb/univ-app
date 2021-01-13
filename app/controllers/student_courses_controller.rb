class StudentCoursesController < ApplicationController
  before_action :set_course, only: :create

  def create
    if current_user.courses.include? @course_to_add
      flash[:notice] = 'Something went wrong with your enrollment'
      redirect_to root_path
    else
      StudentCourse.create(course: @course_to_add, student: current_user)
      flash[:notice] = "Congrats, you enrolled in #{@course_to_add.name}!"
      redirect_to current_user
    end
  end

  def set_course
    @course_to_add = Course.find(params[:course_id])
  end
end
