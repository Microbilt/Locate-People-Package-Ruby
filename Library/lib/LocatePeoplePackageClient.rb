require 'net/http'
require 'json'
require_relative 'clients/EmailSearchClient'
require_relative 'clients/PhoneSearchClient'
require_relative 'clients/ReversePhoneSearchClient'

module LocatePeoplePackage
  class LocatePeoplePackageClient
    attr_reader :authorization, :email_search_client, :phone_search_client, :reverse_phone_search_client, :base_uri

    def initialize(client_id, client_secret, environment_type = EnvironmentType::Production)
      @base_uri = URI(EnvironmentType.descriptions[environment_type])
      @authorization = mba_authorizations(client_id, client_secret)
      @email_search_client = LocatePeoplePackage::APIClients::EmailSearchClient.new(@authorization, @base_uri)
      @phone_search_client = LocatePeoplePackage::APIClients::PhoneSearchClient.new(@authorization, @base_uri)
      @reverse_phone_search_client = LocatePeoplePackage::APIClients::ReversePhoneSearchClient.new(@authorization, @base_uri)
    end

    #def mb_base_client
    # @mb_base_client ||= MBBaseClient.new(@authorization, @base_uri)
    #end

    #def email_search_client
    # @email_search_client ||= EmailSearchClient.new(mb_base_client)
    #end

    #def phone_search_client
    # @phone_search_client ||= PhoneSearchClient.new(mb_base_client)
    #end

    #def reverse_phone_search_client
    # @reverse_phone_search_client ||= ReversePhoneSearchClient.new(mb_base_client)
    #end

    private

    def mba_authorizations(client_id, client_secret)
      uri = URI.join(@base_uri.to_s, 'OAuth/GetAccessToken')
      request = Net::HTTP::Post.new(uri)
      request['Accept'] = 'application/json'
      request.content_type = 'application/json'

      authorization_payload = {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'client_credentials'
      }

      request.body = authorization_payload.to_json

      response = send_request(uri, request)

      if response.code.to_i == 200
        json_response = JSON.parse(response.body)
        if json_response.key?('access_token')
          json_response['access_token']
        else
          raise "Authorization failed: #{response.body}"
        end
      else
        raise "Authorization failed: #{response.body}"
      end
    end

    def send_request(uri, request)
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end
    rescue StandardError => e
      raise "HTTP Request failed: #{e.message}"
    end
  end
end