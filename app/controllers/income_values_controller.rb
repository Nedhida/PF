class IncomeValuesController < ApplicationController
  before_action :ensure_correct_user, except: [:new, :index, :create]

  def index
    user = current_user
    @incomes = user.incomes.all
    @income_values = user.income_values.order("start_time asc")
  end

  def show
  end

  def new
    user = current_user
    @incomes = user.incomes.all
    @income_value = IncomeValue.new
  end

  def edit
    user = current_user
    @incomes = user.incomes.all
  end

  def create
    @income_value = IncomeValue.new(income_value_params)
    if @income_value.save
      redirect_to income_value_path(@income_value), notice: '登録しました'
    else
      render 'index'
    end
  end

  def update
    if @income_value.update(income_value_params)
      redirect_to income_value_path(@income_value), notice: "データを更新しました。"
    else
      render 'index'
    end
  end

  def destroy
	  @income_value.destroy
	  #↓遷移先変更予定
	  redirect_to income_values_path, notice: "データを削除しました"
  end

  private

  def income_value_params
    params.require(:income_value).permit(:income_id, :content, :start_time, :value, :description).merge(user_id: current_user.id, code: 1)
  end

  def ensure_correct_user
    @income_value = IncomeValue.find(params[:id])
    unless @income_value.user_id == current_user.id
      redirect_to incomes_path(current_user)
    end
  end

end
