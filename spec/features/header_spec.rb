require "spec_helper"

feature "Header" do
  scenario "Visit pages and check titles" do
    visit projects_path

    expect(page).to have_css("h3", text: "Projects")

    visit issues_path

    expect(page).to have_css("h3", text: "Backlog")
  end
end