class Drink < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost
  validates_presence_of :alcoholic_bev

  belongs_to :bar
end
