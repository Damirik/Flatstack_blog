require "rails_helper"

feature "Destroy comment" do
  include_context "current user created comment"
  background do
    visit user_root_path
    click_on blog.subject
    click_on post.title
  end

  scenario "User destroyed post" do
    click_on "Delete comment"

    expect(page).to have_content("Comment was successfully destroyed.")
  end
end
