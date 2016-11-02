class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_email = current_user.email
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: 'Comment can not be empty'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
