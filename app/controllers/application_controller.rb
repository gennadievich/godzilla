class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_recent_issues, :get_recent_projects, :current_project

  def get_recent_issues
    current_project.issues.recent_issues
  end

  def get_recent_projects
    Project.recent_projects
  end

  def current_project
    Project.current_project
  end
end
