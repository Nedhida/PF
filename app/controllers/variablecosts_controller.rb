class VariablecostsController < ApplicationController
  before_action :ensure_correct_user, except: [:index, :create]

  def index
    user = current_user
    @variablecosts = user.variablecost.all
    @variablecost = Variablecost.new
  end


	def create
	  @variablecost = Variablecost.new(variablecost_params)
	  if @variablecost.save
	    redirect_to variablecosts_path, notice: '支出項目を登録しました'
	  else
	    render 'index'
	  end
	end
	
	def edit
	end

	def update
	  if @variablecost.update(variablecost_params)
      redirect_to variablecosts_path, notice: "支出項目を更新しました。"
    else
      render 'index'
    end

  end


	def destroy
	  @variablecost.destroy
	  redirect_to variablecosts_path, notice: "支出項目を削除しました"
	end
	
	private

  def variablecost_params
    params.require(:variablecost).permit(:name, :description).merge(user_id: current_user.id)
  end
  
  def ensure_correct_user
    @variablecost = Variablecost.find(params[:id])
    unless @variablecost.user_id == current_user.id
      redirect_to variablecosts_path(current_user)
    end
  end

end
