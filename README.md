# Locate Assets Package Client

A Ruby client for consuming the Microbilt Locate People Package APIs.

For more about APIs You can see on [Microbilt Developer Portal](https://developer.microbilt.com/)

## APIs in this plan:

[EmailSearch](https://developer.microbilt.com/api/EmailSearch)

[PhoneSearch](https://developer.microbilt.com/api/PhoneSearch)

[ReversePhoneSearch](https://developer.microbilt.com/api/ReversePhoneSearch)

# Installation

`composer require Microbilt/Locate-People-Package-Ruby`

# Quick Start

```
locate_people_package_client = LocatePeoplePackage::LocatePeoplePackageClient.new("You_client_id", "You_client_secret")
```
# Configuration

`client_id` required

`client_secret` required

`EnvironmentType` optional (defaults to Production). Other option is Sandbox. 

# Usage
See https://developer.microbilt.com/api/EmailSearch for the necessary parameters to pass in to each function.
For report created request model 
```
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
```
See https://developer.microbilt.com/api/PhoneSearch for the necessary parameters to pass in to each function.
```
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
```

See https://developer.microbilt.com/api/ReversePhoneSearch for the necessary parameters to pass in to each function.
```
reverse_phone_search_request_model = ReversePhoneSearchRequestModel.new(
  phone_number: '865-680-1122'
).to_json

reverse_phone_search_result = locate_people_package_client.reverse_phone_search_client.post(reverse_phone_search_request_model)
```