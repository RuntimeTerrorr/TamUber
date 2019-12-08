# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
VehicleStatus.create :vehicle_id => "17", :tire_pressure => "60Pa", :battery_level => "70%", :lidar_status => "Ok", :occupancy => "0"

# curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d '{"vehicle": {"vehicle_id":"2","msg_timestamp":"1234", "gps": {"lat": "12", "lon": "12", "heading": "0"}}, "battery": "100", "tire_pressure": "100", "occupancy": "0"}' https://lit-fortress-10353.herokuapp.com/dashboard
# curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d '{"email": "oatoor@tamu.edu", "password": "123456"}' https://lit-fortress-10353.herokuapp.com/login