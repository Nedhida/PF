class IncomeValue < ApplicationRecord
  belongs_to :user
  belongs_to :income

  validates :start_time, :value, :code, :income_id, presence: true

end
