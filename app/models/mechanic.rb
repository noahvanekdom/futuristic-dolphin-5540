class MechanicRide < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
end
