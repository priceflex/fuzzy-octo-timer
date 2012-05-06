class ProjectsController < ApplicationController
  before_filter :authenicate

  def index
    @projects = Project.all
  end
end
