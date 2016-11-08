class PostsController < ApplicationController
  before_action :authenticate_user!

  expose(:blog)
  expose(:post)

  def show
  end

  def new
  end

  def edit
  end

  def create
    post.user = current_user
    if post.save
      redirect_to user_blog_path(post.blog.user, post.blog), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if post.update(post_params)
      redirect_to user_root_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    post.destroy
      redirect_to user_blog_path(blog.user, blog), notice: 'Post was successfully destroyed.'
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :blog_id)
    end

end
