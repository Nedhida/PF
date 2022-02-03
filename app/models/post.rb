class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  attachment :image, dependent: :destroy

  #userのfavoriteの有無
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
	validates :body, presence: true

end
