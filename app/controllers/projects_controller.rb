class ProjectsController < ApplicationController
  def index
    @title = "Projects"
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project_types = ProjectType.all
  end

  def create
    project = Project.new(project_params)

    if project.save
      redirect_to projects_path
    else
      raise "Fuck project"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :key, :type_id, :category_id, :url)
  end
end