require 'json'
require 'net/http'
require 'library'
require_relative '../Library/lib/LocatePeoplePackageClient'
require_relative '../Library/lib/helpers/EnvironmentType'
require_relative '../Library/lib/helpers/EmailSearchRequestModel'
require_relative '../Library/lib/clients/EmailSearchClient'
require_relative '../Library/lib/clients/PhoneSearchClient'
require_relative '../Library/lib/clients/ReversePhoneSearchClient'
require_relative '../Library/lib/model/model'

locate_people_package_client = LocatePeoplePackage::LocatePeoplePackageClient.new('yYsbzWjFhn6e4IHvb6pfJjgpQUZ0Kini', 'hNfiMKvG71vbjADL', EnvironmentType::Sandbox)

puts "Test EmailSearchClient:"
person_name = PersonName.new(
  'Kendra',
  '',
  'Williams'
)

address = PostAddr.new(
  '',
  '',
  'CREEKSIDE CIR',
  '404',
  '',
  'AUSTELL',
  'GA',
  '30168',
  '',
  ''
)

email_search_request_model = EmailSearchRequestModel.new(person_name, address,'571490756').to_h.to_json

result = locate_people_package_client.email_search_client.post(email_search_request_model)
puts result.to_s

puts "Test PhoneSearchClient:"
phone_search_person_name = PersonName.new(
  'ERIC',
  '',
  'LINGERFELT'
)

address = PostAddr.new(
  '10604 ALAMEDA DR',
  '',
  '',
  '',
  '',
  'KNOXVILLE',
  'TN',
  '37932',
  '',
  ''
)

phone_search_request_model = PhoneSearchRequestModel.new(phone_search_person_name, address,).to_h.to_json

phone_search_result = locate_people_package_client.phone_search_client.post(phone_search_request_model)
puts phone_search_result.to_s

puts "Test ReversePhoneSearchClient:"
reverse_phone_search_request_model = ReversePhoneSearchRequestModel.new(
  phoneNumber: '865-680-1122'
).to_json

reverse_phone_search_result = locate_people_package_client.reverse_phone_search_client.post(reverse_phone_search_request_model)
puts reverse_phone_search_result.to_s