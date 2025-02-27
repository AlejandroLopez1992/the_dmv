require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_plate_type(vehicle)
    if vehicle.antique? == true
      @plate_type = :antique 
    elsif 
      vehicle.electric_vehicle? == true
      @plate_type = :ev 
    else 
      @plate_type = :regular 
    end
  end

  def register_vehicle_date
    @registration_date = Date.today
  end
end
