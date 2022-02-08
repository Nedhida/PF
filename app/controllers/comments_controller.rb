class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
      
  end

  def destroy
    @comment = Comment.find(params[:book_id]).destroy
    @post = @comment.post
    
  end

  private

  def comment_params
    params.require(:comment).permit(:commnt)
  end

end
