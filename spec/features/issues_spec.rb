require "spec_helper"

feature "Issues" do
  scenario "Visit issues index page" do
    issue1 = create(:issue)
    issue2 = create(:issue)

    visit issues_path

    expect(page).to have_text(issue1.summary)
    expect(page).to have_text(issue1.description)
    expect(page).to have_text(issue2.summary)
    expect(page).to have_text(issue2.description)

    expect(page).to have_link('Create', href: new_issue_path)
  end

  scenario "Visit new issue path and fill in form" do
    visit new_issue_path

    select "Some project", from: "issue_project_id"
    select "New Feature", from: "issue_type_id"
    fill_in "issue_summary", with: Faker::Name.name
    select "Medium", from: "issue_priority_id"
    fill_in "issue_due_date", with: Date.today
    fill_in "issue_description", with: Faker::Lorem.sentence
    fill_in "issue_estimate_time", with: 8
    select "Sprint 1", from: "issue_sprint_id"

    expect(page).to have_button("Create")
  end
end
