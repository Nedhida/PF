class FixedcostsController < ApplicationController
  before_action :ensure_correct_user, except: [:index, :create]

  def index
    user = current_user
    @fixedcosts = user.fixedcosts.all
    @fixedcost = Fixedcost.new
  end


	def create
	  @fixedcost = Fixedcost.new(fixedcost_params)
	  if @fixedcost.save
	    redirect_to fixedcosts_path, notice: '固定費項目を登録しました'
	  else
	    render 'index'
	  end
	end
	
	def edit
	end

	def update
	  if @fixedcost.update(fixedcost_params)
      redirect_to fixedcosts_path, notice: "固定費項目を更新しました。"
    else
      render 'index'
    end

  end


	def destroy
	  @fixedcost.destroy
	  redirect_to fixedcosts_path, notice: "固定費項目を削除しました"
	end
	
	private

  def fixedcost_params
    params.require(:fixedcost).permit(:name, :description).merge(user_id: current_user.id)
  end
  
  def ensure_correct_user
    @fixedcost = Fixedcost.find(params[:id])
    unless @fixedcost.user_id == current_user.id
      redirect_to fixedcosts_path(current_user)
    end
  end

end
