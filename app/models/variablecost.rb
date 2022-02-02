class Variablecost < ApplicationRecord
  belongs_to :user
  has_many :variablecost_values,dependent: :destroy
end
