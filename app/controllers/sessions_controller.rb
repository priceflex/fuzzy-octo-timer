class SessionsController < ApplicationController
  def new
  end
  def create
    employee = Employee.find_by_username(params[:username])
    if employee && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to timer_path, :alert => "Logged in"
    else
      flash.now[:alert] = "Invalid username or password"
      render "new"
    end
  end
  def destory
    session[:employe_id] = nil
    redirect_to log_in_path, :alert => "Logged out"
  end
end
