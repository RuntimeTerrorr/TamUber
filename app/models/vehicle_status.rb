class VehicleStatus < ActiveRecord::Base
    
    def update?(params)
        update_attribute(:tire_pressure, params[:tire_pressure])
        update_attribute(:battery, params[:battery])
        update_attribute(:latitude, params[:latitude])
        update_attribute(:longitude, params[:longitude])
        update_attribute(:heading, params[:heading])
        update_attribute(:occupancy, params[:occupancy])
    end

end
