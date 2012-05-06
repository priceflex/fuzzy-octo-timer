class TimerController < ApplicationController
  before_filter :authenicate

  def index
    if session[:timer_id]
      @timer = Times.find(session[:timer_id])
    else
      @timer = Times.new
    end
    @projects = Project.all
    @project = @timer.project unless @timer.new_record?
  end
  def update
    @timer = current_user.times.find(params[:times][:id])
    @timer.clock_out = Time.now
    @timer.save
    session[:timer_id] = nil
    redirect_to timer_path, :notice => "Stopped Time on #{@timer.project.name}"
  end
  def create
    @timer = current_user.times.new(params[:times])
    @timer.clock_in = Time.now
    if @timer.save
      session[:timer_id] = @timer.id
      redirect_to timer_path, :notice => "Started #{@timer.project.name}" 
    else
      redirect_to timer_path, :notice => "That did not work!" 
    end
  end
end
