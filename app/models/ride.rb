class Ride < ActiveRecord::Base
  include RideHelper

  belongs_to :user
  belongs_to :attraction

  def take_ride
    meets_requirements?
  end
end
