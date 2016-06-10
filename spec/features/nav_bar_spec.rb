require "spec_helper"

feature "Nav bar" do
  let!(:project_type) { create(:project_type) }
  let!(:project) { create(:project, type_id: project_type.id) }

  scenario "Check Nav bar content", skip: true do
    visit root_path

    expect(page).to have_link("Godzilla")
    expect(page).to have_link("Projects")
    expect(page).to have_link("Issues")
    expect(page).to have_link("Create")
  end
end