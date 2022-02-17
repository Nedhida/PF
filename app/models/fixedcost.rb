class Fixedcost < ApplicationRecord
  belongs_to :user
  has_many :fixedcost_values,dependent: :destroy
  
  validates :name, presence: true

end
