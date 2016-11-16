require "rails_helper"

feature "Update post" do
  include_context "current user created post"
  background do
    visit user_root_path
    click_on blog.subject
    click_on post.title
    click_on "Edit"
  end

  scenario "User updates post with valid data" do
    fill_form(:post, :edit, title: "NewTestPost")
    click_button "Update Post"

    expect(page).to have_content("Post was successfully updated")
  end

  scenario "User enter empty post title" do
    fill_form(:post, :edit, title: "")
    click_on "Update Post"

    expect(page).to have_content("can't be blank")
  end
end
