require "rails_helper"

feature "Update blog" do
  include_context "current user created blog"

  background do
    visit user_root_path
    click_on blog.subject
    click_on "Edit"
  end

  scenario "User updates blog with valid data" do
    fill_form(:blog, :edit, subject: "NewTestSubject")
    click_button "Update Blog"

    expect(page).to have_content("Blog was successfully updated")
  end

  scenario "User enter empty subject" do
    fill_form(:blog, :edit, subject: "")
    click_on "Update Blog"

    expect(page).to have_content("can't be blank")
  end
end
