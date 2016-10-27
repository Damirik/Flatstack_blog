shared_context "current user signed in" do
  let(:current_user) { create :user }

  background do
    visit user_root_path
    fill_in 'Email', with: current_user.email
    fill_in 'Password', with: current_user.password
    click_button 'Log in'
  end
end
