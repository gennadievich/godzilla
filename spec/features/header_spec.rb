require "spec_helper"

feature "Header" do
  let!(:project_type) { create(:project_type) }
  let!(:project) { create(:project, type_id: project_type.id) }

  scenario "Visit pages and check titles", skip: true do
    visit projects_path

    expect(page).to have_css("h3", text: "Projects")

    visit project_issues_path

    expect(page).to have_css("h3", text: "Backlog")
  end
end