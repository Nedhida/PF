class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.references :user, foreign_key: true, null: false
      t.references :variablecost_value, foreign_key: true, null: false

      t.timestamps
      #一意性制約
      t.index [:user_id, :variablecost_value_id], unique: true
    end
  end
end
