# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

require_relative "test_helper"
require 'webmock/minitest'

class TestIpgeobase < Minitest::Test
  WebMock.enable!

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  # def test_it_does_something_useful
  #   assert false
  # end

  def test_stub_request
    ip = '8.8.8.8'
    endpoint = URI.parse("http://ip-api.com/xml/#{ip}")

    request_params = {
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent' => 'Ruby'
      }


    stub_request(:get, endpoint).with(headers: request_params).to_return(status: 200)

    Net::HTTP.get(endpoint)
  end
end
