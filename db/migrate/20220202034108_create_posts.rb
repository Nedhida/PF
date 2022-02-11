class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id, null: false
      t.string :title, null: false #タイトル
      t.string :image_id #投稿画像
      t.text :body, null: false #投稿内容

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
