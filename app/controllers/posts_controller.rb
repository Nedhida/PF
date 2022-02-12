class PostsController < ApplicationController

  def show
    @variablecost_value = VariablecostValue.find(params[:id])
    @user = @variablecost_value.user
    @comment = Comment.new
  end

  def index
    @variablecost_values = VariablecostValue.page(params[:page]).reverse_order
    @user = current_user
  end

  
end
