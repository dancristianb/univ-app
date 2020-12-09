class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= Student.find(session[:student_id]) if logged_in?
  end

  def logged_in?
    session[:student_id].present?
  end
end
