class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :variablecost_values

  validates :comment, presence: true

end
