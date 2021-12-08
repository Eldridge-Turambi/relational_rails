class Performer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :repeater

  belongs_to :venue

  def self.alpha_sort
    order(:name)
  end
end
