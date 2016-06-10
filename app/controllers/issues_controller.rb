class IssuesController < ApplicationController
  def index
    @title = "Backlog"
    @issues = current_project.issues.order("updated_at desc")
  end

  def new
    @issue = Issue.new
    @issue_types = IssueType.all
    @issue_priorities = IssuePriority.all
    @projects = Project.all
  end

  def create
    issue = Issue.new(issue_params)

    if issue.save
      set_issue_defaults(issue)
      redirect_to project_issues_path(current_project)
    else
      raise "Fuck issue"
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:project_id, :type_id, :summary, :priority_id,
                                  :due_date, :description, :estimate_time, :sprint_id)
  end

  def set_issue_defaults(issue)
    #issue.reporter = current_user
    #issue.status = Status::OPEN
    #issue.number = incremented number ToDo add number to issue
    #issue.save
  end
end
