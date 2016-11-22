class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :authorize_user!, only: :destroy

  expose_decorated :post
  expose_decorated(:comments) { Comment.by_post(post) }
  expose(:comment, attributes: :comment_params)

  def create
    comment.post = post
    comment.user = current_user
    self.comment = new_comment if comment.save
    render "posts/fragments"
  end

  def destroy
    comment.destroy

    respond_with comment, location: post
  end

  private

  def new_comment
    post.comments.build
  end

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
