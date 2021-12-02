class Bar < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :employee_count
  validates_presence_of :license

  has_many :drinks
end
