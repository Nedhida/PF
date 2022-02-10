class RecordsController < ApplicationController

  def top
  end

  def income_day
    @start_time = params[:start_time]
    @income_values = IncomeValue.where(start_time: @start_time)
    @income_value_total = 0
    @income_values.each do |income_value|
      @income_value_total += income_value.value
    end
  end

end
