class DashboardController < ApplicationController
  
  def post_stats
    params.require(:dashboard).permit(:vehicle_id, :battery, :tire_pressure, :occupancy, :gps)
    params.require(:dashboard).permit(gps: [:lat, :lon, :heading])
    if VehicleStatus.exists?(vehicle_id: params[:dashboard][:vehicle_id])
      @vehicle = VehicleStatus.find_by(vehicle_id: params[:dashboard][:vehicle_id])
      @vehicle.update_stats(params[:dashboard])
      render :json => {:response => 'Updated Vehicle' },:status => 200
    else
      @vehicle = VehicleStatus.new
      @vehicle.update_stats(params[:dashboard])
      render :json => {:response => 'Created New Vehicle' },:status => 201
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
end