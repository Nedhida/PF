class FavoritesController < ApplicationController

  def create
    @variablecost_value = VariablecostValue.find(params[:variablecost_value_id])
    favorite = current_user.favorites.new(variablecost_value_id: @variablecost_value.id)
    favorite.save!
  end

  def destroy
    @variablecost_value = VariablecostValue.find(params[:variablecost_value_id])
    favorite = current_user.favorites.find_by(variablecost_value_id: @variablecost_value.id)
    favorite.destroy
  end

end
