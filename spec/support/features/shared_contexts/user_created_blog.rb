shared_context "current user created blog" do
  include_context "current user signed in"
  let(:blog) { create :blog }

  background do
    visit user_root_path
    click_on 'Create your first blog'
    fill_in 'Subject', with: blog.subject
    click_button 'Create Blog'
  end
end
