class CommentsController < ApplicationController
  before_action :authorize_user!, only: :destroy

  expose :post
  expose :comment

  def create
    comment.post = post
    comment.user = current_user
    comment.save
    respond_with comment, location: post
  end

  def destroy
    comment.destroy
    redirect_to post
  end

  private

  def authorize_user!
    authorize(comment, :authorized?)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
