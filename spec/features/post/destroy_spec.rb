require "rails_helper"

feature "Delete post" do
  include_context "current user created post"
  background do
    visit user_root_path
    click_on blog.subject
    click_on post.title
  end

  scenario "User destroyed post" do
    click_on "Destroy"

    expect(page).to have_content("Post was successfully destroyed")
  end
end
