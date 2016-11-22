class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :authorize_user!, only: :destroy

  expose :post
  expose_decorated :comment

  def create
    comment.post = post
    comment.user = current_user

    comment.save

    redirect_to :back

    #   respond_with comment, location: post
    # else
    #   flash[:alert] = "Comment can't be blank"
    #   redirect_to :back
    # end
  end

  def destroy
    comment.destroy

    respond_with comment, location: post
  end

  private

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
