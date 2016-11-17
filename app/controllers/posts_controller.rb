class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, except: %i(show new create)

  expose :blog
  expose_decorated :post
  expose(:comment) { post.comments.build }

  def show
  end

  def new
  end

  def edit
  end

  def create
    post.user = current_user
    post.blog = blog
    post.save if authorize post
    respond_with post
  end

  def update
    post.update(post_params)
    respond_with post
  end

  def destroy
    post.destroy
    respond_with post, location: post.blog
  end

  private

  def authorize_user!
    authorize(post, :authorized?)
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :blog_id)
  end
end
