class Performer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  belongs_to :venue


  def self.repeated_performers
    where(repeater: true)
  end



  def self.alpha_sort
    order(:name)
  end
end
