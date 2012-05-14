class ProjectsController < ApplicationController
  before_filter :authenicate
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
    unless @project.due_date_string
      @project.due_date_string = Time.now
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to :back, :notice => "Successfully update the project info"
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path, :notice => "Successfully created project #{@project.name}"
    else
      render "new"
    end
  end
end
