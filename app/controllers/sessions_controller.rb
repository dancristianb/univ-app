class SessionsController < ApplicationController
  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student&.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = 'Logged in!'
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid credentials!..'
      render :new
    end
  end

  def destroy
    flash[:notice] = 'Successfully logged out!'
    session[:student_id] = nil

    redirect_to root_path
  end
end
