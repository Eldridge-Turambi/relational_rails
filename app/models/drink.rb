class Drink < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost

  belongs_to :bar

  def self.is_alcoholic
    where(alcoholic_bev: true)
  end

  def self.alpha_sort
    order(:name)
  end
end
