class TimerController < ApplicationController
  def index
      @timer = Times.new 
      @projects = Project.all
      @project_times = Project.where(:project_id => params[:project_id])
  end
end
