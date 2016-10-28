require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, :edit, email: "newemail@test.com", current_password: current_user.password )
    click_button "Update"

    expect(page).to have_content("newemail@test.com")
  end

  scenario "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
