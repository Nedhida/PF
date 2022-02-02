class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|

      t.references :user, foreign_key: true, null: false
      t.string :name, null: false #収入項目名
      t.string :description #備考

      t.timestamps
    end
  end
end
