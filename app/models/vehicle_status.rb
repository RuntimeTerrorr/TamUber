class VehicleStatus < ActiveRecord::Base
    
    def update?(params)
        update_attribute(:vehicle_id, params[:vehicle_id])
        update_attribute(:tire_pressure, params[:tire_pressure])
        update_attribute(:battery_level, params[:battery])
        update_attribute(:latitude, params[:gps][:lat])
        update_attribute(:longitude, params[:gps][:lon])
        update_attribute(:heading, params[:gps][:heading])
        update_attribute(:occupancy, params[:occupancy])
    end

end
