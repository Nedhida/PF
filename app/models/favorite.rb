class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  #１つのpostにuserは重複してfavoriteできない
  validates_uniqueness_of :post_id, scope: :user_id
  
end
