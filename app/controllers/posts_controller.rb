class PostsController < ApplicationController

  def show
    @variablecost_value = VariablecostValue.find(params[:id])
    @user = @variablecost_value.user
    @comment = Comment.new
  end

  def index
    @variablecost_values = VariablecostValue.order(created_at: :desc).page(params[:page])
    @user = current_user
  end


end
