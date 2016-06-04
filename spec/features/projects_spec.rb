require "spec_helper"

feature "Projects" do
  scenario "Visit projects index page" do
    project1 = create(:project)

    visit projects_path

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project1.key)
    expect(page).to have_text(project1.url)
  end
end