require "rails_helper"

feature "Delete post" do
  include_context "current user created post"
  background do
    visit post_path(post)
  end

  scenario "User updates post with valid data" do
    click_on 'Destroy'

    expect(page).to have_content("Post was successfully destroyed")
  end

end
