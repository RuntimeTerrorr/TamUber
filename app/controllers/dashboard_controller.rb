class DashboardController < ApplicationController
  
  def get_stats 
    if VehicleStatus.exists?(vehicle_id: params[:vehicle_id])
      vehicle = VehicleStatus.find_by(vehicle_id: params[:vehicle_id])
      vehicle.update(params)
    else
      vehicle = VehicleStatus.new
      vehicle.update(params)
    end
  end
  
end