class EmployeesController < ApplicationController
  before_filter :authenicate

  def index
    @employees = Employee.all
  end
  def edit
    @employee = Employee.find(params[:id])
  end
  def new
    @employee = Employee.new
  end
  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to employees_path, :notice => "Employee was successfully updated"
    end
  end
  def create
    @employee = Employee.new(params[:employee])
    if @employee.save 
      redirect_to employees_path, :notice => "Employee successfully created"
    else
      render "new"
    end
  end
end
