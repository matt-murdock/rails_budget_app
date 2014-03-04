class Purchase < ActiveRecord::Base
  self.inheritance_column = nil

  validates :type, presence: true
  validates :cost, presence: true
  validates :date, presence: true
  belongs_to :financial_plan
end
