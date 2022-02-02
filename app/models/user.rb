class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  #attachment :profile_image, dependent: :destroy

  has_many :relationships
  #active_relationshipsという架空のクラス（モデル）を作成、relationshipsのfollower_idを参考にactiverelationshipsにアクセスする
  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user_id)
    self.active_relationships.create!(followed_id: user_id)
  end

  #フォローがあればアンフォローする
  def unfollow(user_id)
    self.active_relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    self.following.include?(user)
  end

  has_many :incomes
  has_many :income_values
  has_many :fixedcosts
  has_many :fixedcost_values
  has_many :variablecosts
  has_many :variablecost_values
end
