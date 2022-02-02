class CreateFixedcosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fixedcosts do |t|

      t.references :user, foreign_key: true, null: false
      t.string :name, null: false #固定費項目名
      t.string :description #備考

      t.timestamps
    end
  end
end
