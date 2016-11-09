shared_context "current user created post" do
  include_context "current user created blog"
  let(:post) { create :post }

  background do
    visit user_root_path
    click_on blog.subject
    click_on "New Post"
    fill_in "Title", with: post.title
    fill_in "Content", with: post.content
    click_button "Create Post"
  end
end
