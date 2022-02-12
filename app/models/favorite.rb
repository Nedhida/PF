class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :variablecost_value
  
  #１つのpostにuserは重複してfavoriteできない
  validates_uniqueness_of :variablecost_value_id, scope: :user_id
  
end
