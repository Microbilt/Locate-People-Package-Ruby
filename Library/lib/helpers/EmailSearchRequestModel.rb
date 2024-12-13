require 'json'

class EmailSearchRequestModel
  attr_accessor :name, :address, :ssn

  def to_json(*_args)
    {
      name: @name,
      address: @address,
      ssn: @ssn
    }.to_json
  end
end
