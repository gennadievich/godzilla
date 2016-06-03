class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
    @issue_types = IssueType.all
  end

  def create
    issue = Issue.new(issue_params)

    if issue.save
      set_issue_defaults(issue)
      redirect_to issues_path
    else
      raise "Fuck"
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
