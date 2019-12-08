class AddVehicleIdAndGps < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicle_statuses, :vehicle_id, :string
    add_column :vehicle_statuses, :latitude, :string
    add_column :vehicle_statuses, :longitude, :string
    add_column :vehicle_statuses, :heading, :string
    add_column :vehicle_statuses, :occupancy, :string
    add_index  :vehicle_statuses, :vehicle_id
  end
end
