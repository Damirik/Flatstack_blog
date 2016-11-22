class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :authorize_user!, only: :destroy

  expose_decorated :post
  expose :comment
  expose_decorated(:comments) { post_comments }

  def create
    comment.post = post
    comment.user = current_user
    if comment.save
      respond_with comment, location: post
    else
      render "posts/show"
    end
  end

  def destroy
    comment.destroy

    respond_with comment, location: post
  end

  private

  def post_comments
    post.comments.order(created_at: :desc).page(params[:page]).per(3)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
