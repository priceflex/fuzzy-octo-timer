class TimerController < ApplicationController
  before_filter :authenicate
  
  def index
    @timer = Times.new 
    @projects = Project.all
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
