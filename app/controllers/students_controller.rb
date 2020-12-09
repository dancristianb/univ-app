class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'You have been successfully signed up!'
      redirect_to @student
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      flash[:notice] = 'Student information has been successfully updated!'
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
