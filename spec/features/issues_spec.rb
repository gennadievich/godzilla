require "spec_helper"

feature "Issues" do
  scenario "Visit issues index page" do
    issue1 = create(:issue)
    issue2 = create(:issue)

    visit issues_path

    expect(page).to have_text(issue1.summary)
    expect(page).to have_text(issue1.estimate_time)
    expect(page).to have_text(issue2.summary)
    expect(page).to have_text(issue2.estimate_time)

    expect(page).to have_link('Create', href: new_issue_path)
  end

  scenario "Visit new issue path and create issue" do
    visit new_issue_path

    summary = Faker::Name.name
    description = Faker::Lorem.sentence
    et = 8

    select "Some project", from: "issue_project_id"
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
end
