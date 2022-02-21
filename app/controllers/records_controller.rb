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
    @day_total = @income_value_total - (@fixedcost_value_total + @variablecost_value_total)
  end

  #月の収支グラフ
  def graph_month
    # (1) * = 可変長引数、配列として認識される。    (2) split("-") = 文字列を"-"で分断。(3)Time.local = Time オブジェクトを返す。 (4).all_month = その月の１日から月末まで。(5)where = テーブルから（４）の条件で取得。group_by_month = 月ごとにグループ化
    # @start_time = "2022-02" =>  (1)["2022-02"] => (2)["2022", "02"] =>                (3)2022-02-01 00:00:00 +0000 =>           (4)2022-02-01 00:00:00 +0000..2022-02-28 23:59:59 +0000

    #月の収入額合計
    
    @in_value_month = IncomeValue.where(start_time: Time.local(*@start_time.split("-")).all_month)#.group_by_month(:start_time)
    @income_value_total = 0
    @in_value_month.each do |income_value|
      @income_value_total += income_value.value
    end

    #月の固定費額合計
    @fix_value_month = FixedcostValue.where(start_time: Time.local(*@start_time.split("-")).all_month)#.group_by_month(:start_time)
    @fixedcost_value_total = 0
    @fix_value_month.each do |fixedcost_value|
      @fixedcost_value_total += fixedcost_value.value
    end

    #月の支出額合計
    @var_value_month = VariablecostValue.where(start_time: Time.local(*@start_time.split("-")).all_month)#.group_by_month(:start_time)
    @variablecost_value_total = 0
    @var_value_month.each do |variablecost_value|
      @variablecost_value_total +=  variablecost_value.value
    end
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
      @fixedcost_value_total += fixedcost_value.value
    end
  end

  def variablecost
    @variablecosts = Variablecost.order(created_at: :asc)
    @variablecost_values = VariablecostValue.where(start_time: @start_time)
    @variablecost_value_total = 0
    @variablecost_values.each do |variablecost_value|
      @variablecost_value_total +=  variablecost_value.value
    end
  end

end
