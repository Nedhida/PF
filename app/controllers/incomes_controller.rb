class IncomesController < ApplicationController
  before_action :ensure_correct_user, except: [:index, :create]

  def index
    user = current_user
    @incomes = user.incomes.all
    @income = Income.new
  end


	def create
	  @income = Income.new(income_params)
	  if @income.save
	    redirect_to incomes_path, notice: '収入項目を登録しました'
	  else
	  	@incomes = user.incomes.all
	    render 'index'
	  end
	end

	def edit
	end

	def update
	  if @income.update(income_params)
	    redirect_to incomes_path, notice: "収入項目を更新しました。"
	  else
	    render 'edit'
	  end
	end


	def destroy
	  @income.destroy
	  redirect_to incomes_path, notice: "収入項目を削除しました"
	end

	private

  def income_params
    params.require(:income).permit(:name, :description).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @income = Income.find(params[:id])
    unless @income.user_id == current_user.id
      redirect_to incomes_path(current_user)
    end
  end

end
