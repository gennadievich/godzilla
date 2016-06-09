class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_recent_issues, :get_recent_projects

  def get_recent_issues
    Issue.recent_issues
  end

  def get_recent_projects
    Project.recent_projects
  end
end
