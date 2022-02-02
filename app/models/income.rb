class Income < ApplicationRecord
  belongs_to :user
  has_many :income_values,dependent: :destroy
end
