class VariablecostValue < ApplicationRecord
  belongs_to :user
  belongs_to :variablecost
  has_many :favorites, dependent: :destroy
  #投稿が誰にいいねされているか取得
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  validates :start_time, :value, :code, :variablecost_id, :privacy, presence: true

  #userのfavoriteの有無
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
