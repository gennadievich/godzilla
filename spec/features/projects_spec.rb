require "spec_helper"

feature "Projects" do
  scenario "Visit projects index page" do
    project1 = create(:project)

    visit projects_path

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project1.key)
    expect(page).to have_text(project1.url)
  end

  scenario "Visit new project path and create project" do
    visit new_project_path

    name = Faker::Name.name
    key = name.capitalize
    url = Faker::Internet.url

    fill_in "name", with: name
    fill_in "key", with: key
    select "Software", from: "project_type_id"
    fill_in "url", with: url

    click_button "Create"

    expect(page).to have_text(name)
    expect(page).to have_text(key)
    expect(page).to have_text(url)
  end
end