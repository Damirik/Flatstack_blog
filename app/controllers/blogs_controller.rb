class BlogsController < ApplicationController
  before_action :authenticate_user!

  expose(:blog)
  expose(:posts) { blog.posts }

  def show
  end

  def new

  end

  def edit
  end

  def create
    blog.user_id = current_user.id
    if blog.save
      redirect_to user_root_path, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if blog.update(blog_params)
       redirect_to user_root_path, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    blog.destroy
    redirect_to user_root_path, notice: 'Blog was successfully destroyed.'
  end

  private
    def blog_params
      params.require(:blog).permit(:subject, :user_id)
    end

end
