class VehicleStatus < ActiveRecord::Base
    
    def update?(params)
        update_attribute(:vehicle_id, params["vehicle_id"])
        update_attribute(:latitude, params["latitude"])
        update_attribute(:longitude, params["longitude"])
        update_attribute(:heading, params["heading"])
        update_attribute(:occupancy, params["occupancy"])
    end
end
