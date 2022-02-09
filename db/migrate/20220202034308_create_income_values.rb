class CreateIncomeValues < ActiveRecord::Migration[5.2]
  def change
    create_table :income_values do |t|

      t.references :user, foreign_key: true, null: false
      t.references :income, foreign_key: true, null: false
      t.string :content #収入内容
      t.date :date, null:false #年月日
      t.integer :value, null: false #金額
      t.string :description #備考

      t.timestamps
    end
  end
end
