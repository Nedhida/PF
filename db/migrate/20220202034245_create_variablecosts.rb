class CreateVariablecosts < ActiveRecord::Migration[5.2]
  def change
    create_table :variablecosts do |t|

      t.references :user, foreign_key: true, null: false
      t.string :name, null: false #支出項目名
      t.string :description #備考

      t.timestamps
    end
  end
end
