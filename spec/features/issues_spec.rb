require "spec_helper"

feature "Issues" do

  before :all do
    create_issue_types
    create_issue_priorities
  end

  let!(:project_type) { create(:project_type) }
  let!(:project) { create(:project, type_id: project_type.id) }

  scenario "Visit issues index page", skip: true do
    issue1 = create(:issue, project_id: project.id)
    issue2 = create(:issue, project_id: project.id)

    visit issues_path

    expect(page).to have_text(issue1.summary)
    expect(page).to have_text(issue1.estimate_time)
    expect(page).to have_text(issue2.summary)
    expect(page).to have_text(issue2.estimate_time)

    expect(page).to have_link('Create', href: new_issue_path)
  end

  scenario "Visit new issue path and create issue", skip: true do
    visit new_issue_path

    summary = Faker::Name.name
    description = Faker::Lorem.sentence
    et = 8

    select project.name, from: "issue_project_id"
    select "New Feature", from: "issue_type_id"
    fill_in "issue_summary", with: summary
    select "Medium", from: "issue_priority_id"
    fill_in "issue_due_date", with: Date.today
    fill_in "issue_description", with: description
    fill_in "issue_estimate_time", with: et
    select "Sprint 1", from: "issue_sprint_id"

    click_button "Create"

    expect(page).to have_text(summary)
    expect(page).to have_text(et)
  end

  scenario "Check recent issues at nav bar", skip: true do
    issue1 = create(:issue, project_id: project.id)
    issue2 = create(:issue, project_id: project.id)
    issue3 = create(:issue, project_id: project.id)
    issue4 = create(:issue, project_id: project.id)

    visit projects_path

    expect(page).to have_link(issue4.summary)
    expect(page).to have_link(issue3.summary)
    expect(page).to have_link(issue2.summary)
  end

  private

  def create_issue_types
    issue_types = [
      {name: "New Feature", icon_path: "new_feature.svg", display_order: 0},
      {name: "Bug", icon_path: "bug.svg", display_order: 1},
      {name: "Task", icon_path: "task.svg", display_order: 2},
      {name: "Improvement", icon_path: "improvement.svg", display_order: 3},
      {name: "Epic", icon_path: "epic.svg", display_order: 4},
      {name: "Story", icon_path: "story.svg", display_order: 5},
      {name: "IT Help", icon_path: "it_help.svg", display_order: 6},
      {name: "Purchase", icon_path: "purchase.svg", display_order: 7},
      {name: "Story", icon_path: "story.svg", display_order: 8},
      {name: "Access", icon_path: "access.svg", display_order: 9}
    ]

    issue_types.each { |type| IssueType.create(name: type[:name], icon_path: type[:icon_path], display_order: type[:display_order]) }
  end

  def create_issue_priorities
    issue_priorities = [
      {name: "Lowest", icon_path: "lowest.svg", display_order: 4},
      {name: "Low", icon_path: "low.svg", display_order: 3},
      {name: "Medium", icon_path: "medium.svg", display_order: 0},
      {name: "High", icon_path: "high.svg", display_order: 2},
      {name: "Highest", icon_path: "highest.svg", display_order: 1}
    ]

    issue_priorities.each { |p| IssuePriority.create(name: p[:name], icon_path: p[:icon_path], display_order: p[:display_order]) }
  end
end
