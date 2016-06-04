require "spec_helper"

feature "Nav bar" do
  scenario "Check Nav bar content" do
    visit root_path

    expect(page).to have_link("Godzilla")
    expect(page).to have_link("Projects")
    expect(page).to have_link("Issues")
    expect(page).to have_link("Create")
  end
end