require "rails_helper"

feature "Cancel Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User cancels account" do
    click_link "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
