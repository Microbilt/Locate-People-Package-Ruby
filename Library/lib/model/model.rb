class EmailSearchRequestModel
  attr_accessor :name, :address, :ssn

  def initialize(name = nil, address = nil, ssn = nil)
    @name = name
    @address = address
    @ssn = ssn
  end

  def to_h
    {
      Name: @name.to_h,
      Address: @address.to_h,
      Ssn: @ssn
    }
  end
end

class PersonName
  attr_accessor :firstName, :middleName, :lastName

  def initialize(first_name = nil, middle_name = nil, last_name = nil)
    @firstName = first_name
    @middleName = middle_name
    @lastName = last_name
  end

  def to_h
    {
      firstName: @firstName,
      middleName: @middleName,
      lastName: @lastName
    }
  end
end

class PostAddr
  attr_accessor :addr1, :addr2, :streetName, :streetNum, :apt, :city, :state, :zip, :county, :country

  def initialize(addr1 = nil, addr2 = nil, street_name = nil, street_num = nil, apt = nil, city = nil, state = nil, zip = nil, county = nil, country = nil)
    @addr1 = addr1
    @addr2 = addr2
    @streetName = street_name
    @streetNum = street_num
    @apt = apt
    @city = city
    @state = state
    @zip = zip
    @county = county
    @country = country
  end

  def to_h
    {
      addr1: @addr1,
      addr2: @addr2,
      streetName: @streetName,
      streetNum: @streetNum,
      apt: @apt,
      city: @city,
      state: @state,
      zip: @zip,
      county: @county,
      country: @country
    }
  end
end

class PhoneSearchRequestModel
  attr_accessor :name, :address

  def initialize(name = nil, address = nil)
    @name = name
    @address = address
  end

  def to_h
    {
      Name: @name.to_h,
      Address: @address.to_h
    }
  end
end

class ReversePhoneSearchRequestModel
  attr_accessor :phoneNumber

  def initialize(phone_number = nil)
    @phoneNumber = phone_number
  end

  def to_h
    {
      phoneNumber: @phoneNumber
    }
  end
end