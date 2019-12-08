class DashboardController < ApplicationController
  
  def post_stats
    search_id = params[:vehicle_id]
    params[:vehicle] = {
      :vehicle_id => params[:vehicle_id],
      :battery_level => params[:battery],
      :tire_pressure => params[:tire_pressure],
      :occupancy => params[:occupancy],
      :latitude => params[:gps][:lat],
      :longitude => params[:gps][:lon],
      :heading => params[:gps][:heading]
    }
    if VehicleStatus.exists?(vehicle_id: search_id)
      vehicle = VehicleStatus.find_by(vehicle_id: search_id)
      vehicle.update(params[:vehicle])
      render status: 200
    else
      vehicle = VehicleStatus.new(vehicle_status_params)
      vehicle.update(params[:vehicle])
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
      params.require(:vehicle).permit(:vehicle_id, :battery_level, :tire_pressure, :occupancy, :latitude, :longitude, :heading)
    end
end