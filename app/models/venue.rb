class Venue < ApplicationRecord
  validates_presence_of :name
  
  validates_presence_of :capacity

  has_many :performers

  def performer_count
    performers.count
  end
end
