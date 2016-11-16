shared_context "current user created comment" do
  include_context "current user created post"
  let(:comment) { create :comment }

  background do
    visit user_root_path
    click_on blog.subject
    click_on post.title
    fill_in "Body", with: comment.body
    click_button "Create Comment"
  end
end
