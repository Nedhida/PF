class FixedcostValue < ApplicationRecord
  belongs_to :user
  belongs_to :fixedcost
  
  validates :start_time, :code, :fixedcost_id, presence: true
  validates :value, format: { with: /\A[0-9]+\z/ } #数値半角
  
end
