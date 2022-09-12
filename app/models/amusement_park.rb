class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alph
    rides.order(:name)
  end

  def avg_thrill_rating
    rides.average(:thrill_rating)
  end
end