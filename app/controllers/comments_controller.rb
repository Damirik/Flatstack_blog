class CommentsController < ApplicationController
  expose :post
  expose :comment

  def create
    comment.post = post
    comment.user = current_user
    if comment.save
      redirect_to post
    else
      redirect_to post, notice: "Comment can not be empty"
    end
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
