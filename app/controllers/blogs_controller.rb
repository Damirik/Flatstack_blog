class BlogsController < ApplicationController
  before_action :authorize_user!, only: %i(edit update destroy)

  expose_decorated :blog
  expose_decorated(:posts) { blog_posts }

  def show
  end

  def new
  end

  def edit
  end

  def create
    blog.user = current_user
    blog.save
    respond_with blog
  end

  def update
    blog.update(blog_params)
    respond_with blog
  end

  def destroy
    blog.destroy
    respond_with blog, location: user_root_path
  end

  private

  def blog_posts
    blog.posts.order(created_at: :desc).page(params[:page]).per(3)
  end

  def authorize_user!
    authorize(blog, :manage?)
  end

  def blog_params
    params.require(:blog).permit(:subject, :user_id)
  end
end
