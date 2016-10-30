shared_context "current user signed in" do
  let(:current_user) { create :user }

  background do
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: current_user.email
    fill_in 'Password', with: current_user.password
    click_button 'Sign in'
  end
end
