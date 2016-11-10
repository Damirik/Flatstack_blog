class CommentsController < ApplicationController
  respond_to :html

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

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
