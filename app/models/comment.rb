class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :variablecost_value

  validates :comment, presence: true

end
