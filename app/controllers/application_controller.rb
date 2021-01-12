class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :require_user

  def current_user
    @current_user ||= Student.find(session[:student_id]) if logged_in?
  end

  def logged_in?
    session[:student_id].present?
  end

  def require_user
    unless logged_in?
      flash[:notice] = 'You must be logged in to perform this action!'
      redirect_to login_path
    end
  end
end
