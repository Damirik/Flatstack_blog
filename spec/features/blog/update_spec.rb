require "rails_helper"

feature "Update blog" do
  include_context "current user created blog"

  background do
    visit edit_user_blog_path(blog.user, blog)
  end

  scenario "User updates blog with valid data" do
    fill_form(:blog, :edit, subject: "NewTestSubject" )
    click_button "Update Blog"

    expect(page).to have_content("NewTestSubject")
  end

  scenario "User enter empty subject" do
    fill_form(:user, :edit, subject: "")
    click_on "Update Blog"

    expect(page).to have_content("can't be blank")
  end
end
