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
  end
end
