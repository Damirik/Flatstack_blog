class PostsController < ApplicationController
  respond_to :html

  before_action :authenticate_user!

  expose :blog
  expose :post

  def show
  end

  def new
  end

  def edit
  end

  def create
    post.user = current_user
    post.save
    respond_with post, location: user_blog_path(post.blog.user, post.blog)
  end

  def update
    post.update(post_params)
    respond_with post, location: user_blog_path(post.blog.user, post.blog)
  end

  def destroy
    post.destroy
    respond_with post, location: user_blog_path(post.blog.user, post.blog)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :blog_id)
  end
end
