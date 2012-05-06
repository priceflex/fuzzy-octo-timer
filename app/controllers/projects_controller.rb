class ProjectsController < ApplicationController
  before_filter :authenicate

  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
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
