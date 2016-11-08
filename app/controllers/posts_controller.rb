class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :destroy]
  before_action :authenticate_user!

  def show
  end

  def new
    @blog = Blog.find_by(params[:id])
    @post = @blog.posts.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @blog = @post.blog
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_blog_path(@blog.user, @blog),
        notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_root_path,
        notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_blog_path(@blog.user, @blog),
      notice: 'Post was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_blog
      @blog = @post.blog
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :blog_id)
    end
end
