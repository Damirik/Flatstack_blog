class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose :blog
  expose :posts, from: :blog

  def show
  end

  def new
  end

  def edit
  end

  def create
    blog.user = current_user
    blog.save
    respond_with blog, location: user_root_path
  end

  def update
    blog.update(blog_params)
    respond_with blog, location: user_root_path
  end

  def destroy
    blog.destroy
    respond_with blog, location: user_root_path
  end

  private

  def authorize_user!
    authorize(blog, :authorized?)
  end

  def blog_params
    params.require(:blog).permit(:subject, :user_id)
  end
end
