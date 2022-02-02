class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: true, null: false
      t.string :title, null: false #タイトル
      t.string :image_id #投稿画像
      t.text :body, null: false #投稿内容

      t.timestamps
    end
  end
end
