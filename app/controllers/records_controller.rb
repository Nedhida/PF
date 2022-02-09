class RecordsController < ApplicationController

  def top
  end
  
  def income_day
    @date = params[:date]
    @incomes = Income.order(created_at: :asc)
    @income_values = IncomeValue.where(date: @date)
    @income_value_total = 0
    @income_values.each do |income_value|
      @income_value_total += income_value.value
    end
  end

end
