class VehicleStatus < ActiveRecord::Base
    
    def update_stats(info)
        update_attribute(:vehicle_id, info[:vehicle_id])
        update_attribute(:tire_pressure, info[:tire_pressure])
        update_attribute(:battery_level, info[:battery])
        update_attribute(:latitude, info[:gps][:lat])
        update_attribute(:longitude, info[:gps][:lon])
        update_attribute(:heading, info[:gps][:heading])
        update_attribute(:occupancy, info[:occupancy])
    end

end
