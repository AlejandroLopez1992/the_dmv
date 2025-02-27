class FacilityFactory

  def create_facilities_oregon(facility_database)
    if facility_database == []
      return nil
    end
    facility_instances = []
    facility_database.each do |facility|
     address_data = facility[:location_1][:human_address]
     address = JSON.parse(address_data)
      facility_instances.push(Facility.new({name: facility[:title], 
                                            address: address.values.join(' ') , 
                                            phone: facility[:phone_number]}))
    end
    facility_instances
  end

  def create_facilities_new_york(facility_database)
    if facility_database == []
      return nil
    end
    facility_instances = []
    facility_database.each do |facility|
      address = facility[:street_address_line_1],
                facility[:street_address_line_2], 
                facility[:city], 
                facility[:state], 
                facility[:zip_code]
      facility_instances.push(Facility.new({name: facility[:office_name], 
                                            address: address.compact.join(' ') , 
                                            phone: facility[:public_phone_number]}))
    end
    facility_instances
  end

  def create_facilities_missouri(facility_database)
    if facility_database == []
      return nil
    end
    facility_instances = []
    facility_database.each do |facility|
      address = facility[:address1],
                facility[:city].rstrip,
                facility[:state],
                facility[:zipcode]
      name = facility[:name]
      facility_instances.push(Facility.new({name: name.rstrip,
                                            address: address.compact.join(' '),
                                            phone: facility[:phone]}))
    end
    facility_instances
  end
end