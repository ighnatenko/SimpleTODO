class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_projects, only: [:update, :destroy]

  def index
    @projects = current_user.projects.order(:created_at)
  end

  def create
    @project = current_user.projects.create project_params
  end

  def update
    @project.update(project_params)
  end

  def destroy
    @project.destroy
  end

  private
  
  def find_projects
    @project = current_user.projects.find(params[:id])  
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
