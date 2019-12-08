class DashboardController < ApplicationController
  
  def post_stats
    puts request.raw_post
    puts params[:vehicle_id]
    if VehicleStatus.exists?(vehicle_id: params[:vehicle_id])
      vehicle = VehicleStatus.find_by(vehicle_id: params[:vehicle_id])
      vehicle.update(params)
      render status: 200
    else
      vehicle = VehicleStatus.new(vehicle_status_params)
      vehicle.update(params)
      render status: 201
    end
  end
  
  def get_stats
    vehicle = VehicleStatus.find_by(vehicle_id: session[:current_vehicle_id])
    # vehicle = nil
    if vehicle
      @vehicle_stats = {
        "time" => vehicle.updated_at,
        "tire_pressure" => vehicle.tire_pressure,
        "battery_level" => vehicle.battery_level,
        "occupancy" => vehicle.occupancy,
        "lidar_status" => ""
      }
    else
      @vehicle_stats = {
        "time" => "Server is Down!",
        "tire_pressure" => "Server is Down!",
        "battery_level" => "Server is Down!",
        "occupancy" => "Server is Down!",
        "lidar_status" => "Server is Down!"
      }
    end
    render json: @vehicle_stats
  end
  
  private

    def vehicle_status_params
      params.permit(:vehicle_id, :battery, :tire_pressure, :occupancy, :gps)
      params.permit(gps: [:lat, :lon, :heading])
    end
end