class TimerController < ApplicationController
  before_filter :authenicate

  def index
    if current_user.current_timer_id
      @timer = Times.find(current_user.current_timer_id)
      @timer.notes.strip
    else
      @timer = Times.new(:notes => cookies[:notes], :project_id => cookies[:project_id])
    end
    @projects = Project.all
    @project = @timer.project unless @timer.new_record?
  end
  def update
    @timer = current_user.times.find(params[:times][:id])
    unless @timer.clock_out 
      @timer.clock_out = Time.now
    end
    @timer.notes = params[:times][:notes]
    @timer.save
    current_user.current_timer_id = nil
    current_user.save
    redirect_to timer_path, :notice => "Stopped Time on #{@timer.project.name}"
  end
  def create
    @timer = current_user.times.new(params[:times])
    @timer.notes = params[:times][:notes].strip
    @timer.clock_in = Time.now
    if @timer.save
      cookies[:project_id] = @timer.project_id
      cookies[:notes] = @timer.notes

      current_user.current_timer_id = @timer.id
      current_user.save
      redirect_to timer_path, :notice => "Started #{@timer.project.name}" 
    else
      redirect_to timer_path, :notice => "That did not work!" 
    end
  end
end
