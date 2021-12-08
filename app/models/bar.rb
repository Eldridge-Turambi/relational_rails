class Bar < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :employee_count
  validates_presence_of :license

  has_many :drinks

  def drinks_count
    drinks.count
  end

  def self.cost_filter(cost)
    Drink.where("cost > ?", cost)
  end
end
