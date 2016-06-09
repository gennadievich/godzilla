class ProjectsController < ApplicationController
  def index
    process_filter_params
    @title = "Projects"
    @projects = params[:project_category] == "Recent Projects" ? Project.recent : Project.all
    @projects = @pt_id ? @projects.where("type_id = ?", @pt_id) : @projects
    @project_types = ProjectType.all
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

  def process_filter_params
    pt = params[:project_type]
    pc = params[:project_category]
    @pt_id = ProjectType.find_by(name: pt).try(:id) if pt

    @type_filter ||= pt && @pt_id ? pt : "All Project Types"
    @category_filter ||= pc ? pc : "All Categories"
  end
end