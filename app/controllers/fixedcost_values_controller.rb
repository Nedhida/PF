class FixedcostValuesController < ApplicationController
  before_action :ensure_correct_user, except: [:new, :index, :create]

  def index
    user = current_user
    @fixedcosts = user.fixedcosts.all
    @fixedcost_values = user.fixedcost_values.order("start_time asc")
  end

  def show
  end

  def new
    user = current_user
    @fixedcosts = user.fixedcosts.all
    @fixedcost_value = FixedcostValue.new
  end

  def edit
    user = current_user
    @fixedcosts = user.fixedcosts.all
  end

  def create
    @fixedcost_value = FixedcostValue.new(fixedcost_value_params)
    if @fixedcost_value.save
      redirect_to fixedcost_value_path(@fixedcost_value), notice: '登録しました'
    else
      render 'new'
    end
  end

  def update
    if @fixedcost_value.update(fixedcost_value_params)
      redirect_to fixedcost_value_path(@fixedcost_value), notice: "データを更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
	  @fixedcost_value.destroy
	  #↓遷移先変更予定
	  redirect_to fixedcost_values_path, notice: "データを削除しました"
  end

  private

  def fixedcost_value_params
    params.require(:fixedcost_value).permit(:fixedcost_id, :content, :start_time, :value, :description).merge(user_id: current_user.id, code: 2)
  end

  def ensure_correct_user
    @fixedcost_value = FixedcostValue.find(params[:id])
    unless @fixedcost_value.user_id == current_user.id
      redirect_to fixedcosts_path(current_user)
    end
  end

end
