class CommentsController < ApplicationController

  def create
    @variablecost_value = VariablecostValue.find(params[:variablecost_value_id])
    @comment = current_user.comments.new(comment_params)
    @comment.variablecost_value_id = @variablecost_value.id
    @comment.save
  end

  def destroy
    @variablecost_value = VariablecostValue.find(params[:variablecost_value_id])
    @comment = @variablecost_value.comments.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
