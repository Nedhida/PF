class FixedcostValue < ApplicationRecord
  belongs_to :user
  belongs_to :fixedcost
  
  validates :start_time, :value, :code, :fixedcost_id, presence: true
  
end
