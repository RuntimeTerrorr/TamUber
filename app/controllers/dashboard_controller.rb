class DashboardController < ApplicationController
  
  def get_stats 
    @vehicle_stats = VehicleStatus.receive_stats
    return @vehicle_stats
  end

end