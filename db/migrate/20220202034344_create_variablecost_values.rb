class CreateVariablecostValues < ActiveRecord::Migration[5.2]
  def change
    create_table :variablecost_values do |t|

      t.references :user, foreign_key: true, null: false
      t.references :variablecost, foreign_key: true, null: false
      t.string :content #支出内容
      t.date :start_time, null:false #年月日
      t.integer :value, null: false #金額
      t.string :description #備考

      t.timestamps
    end
  end
end
