class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.references :follower, foreign_key: true, null: false
      t.references :followed, foreign_key: true, null: false

      t.timestamps
       #一意性制約
      t.index [:follower_id, :followed_id], unique: true

    end
  end
end
