class RecordsController < ApplicationController
  before_action :set_start_time
  before_action :income, only: %i[income_day day]
  before_action :fixedcost, only: %i[fixedcost_day day]
  before_action :variablecost, only: %i[variablecost_day day]

  #月の収支合計カレンダー
  def month
    user = current_user
    @income_values = user.income_values.order("start_time asc")
    @fixedcost_values = user.fixedcost_values.order("start_time asc")
    @variablecost_values = user.variablecost_values.order("start_time asc")
    @all_values = @income_values + @fixedcost_values + @variablecost_values
  end

  #日の収入合計
  def income_day
  end

  #日の固定費合計
  def fixedcost_day
  end

  #日の支出合計
  def variablecost_day
  end

  #日の収支合計
  def day
    @day_total = @income_value_total + @fixedcost_value_total + @variablecost_value_total
  end



  private

  def set_start_time
    @start_time = params[:start_time]
  end

  def income
    @incomes = Income.order(created_at: :asc)
    @income_values = IncomeValue.where(start_time: @start_time)
    @income_value_total = 0
    @income_values.each do |income_value|
      @income_value_total += income_value.value
    end
  end

  def fixedcost
    @fixedcosts = Fixedcost.order(created_at: :asc)
    @fixedcost_values = FixedcostValue.where(start_time: @start_time)
    @fixedcost_value_total = 0
    @fixedcost_values.each do |fixedcost_value|
      @fixedcost_value_total -= fixedcost_value.value
    end
  end

  def variablecost
    @variablecosts = Variablecost.order(created_at: :asc)
    @variablecost_values = VariablecostValue.where(start_time: @start_time)
    @variablecost_value_total = 0
    @variablecost_values.each do |variablecost_value|
      @variablecost_value_total -=  variablecost_value.value
    end
  end

end
