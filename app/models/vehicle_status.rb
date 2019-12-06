class VehicleStatus < ActiveRecord::Base
    
    def receive_stats?(result):
        update_attribute(:vehicle_id, result["vehicle_id"])
        update_attribute(:latitude, result["latitude"])
        update_attribute(:longitude, result["longitude"])
        update_attribute(:heading, result["heading"])
        update_attribute(:occupancy, result["occupancy"])
    end
end
