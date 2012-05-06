class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def authenicate
    unless current_user
      redirect_to log_in_path, :alert => "Please login!"
    end
  end
  def current_user
    if session[:employee_id]
      @current_user ||= Employee.find(session[:employee_id])
    end
  end
  helper_method :current_user
end
