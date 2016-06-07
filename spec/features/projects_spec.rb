require "spec_helper"

feature "Projects" do
  let!(:project_type) { create(:project_type) }

  scenario "Visit projects index page", skip: true do
    project1 = create(:project, type_id: project_type.id)

    visit projects_path

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project1.key)
    expect(page).to have_text(project1.url)
  end

  scenario "Visit new project path and create project", skip: true do
    visit new_project_path

    name = Faker::Name.name
    key = name.capitalize
    url = Faker::Internet.url

    fill_in "project_name", with: name
    fill_in "project_key", with: key
    select project_type.name, from: "project_type_id"
    fill_in "project_url", with: url

    click_button "Create"

    expect(page).to have_text(name)
    expect(page).to have_text(key)
    expect(page).to have_text(url)
  end
end