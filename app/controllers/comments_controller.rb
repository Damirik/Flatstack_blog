class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_email = current_user.email
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: 'Comment can be empty'
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
