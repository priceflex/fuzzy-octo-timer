class EmployeesController < ApplicationController
  before_filter :authenicate

  def index
    @employees = Employee.all
  end
end
