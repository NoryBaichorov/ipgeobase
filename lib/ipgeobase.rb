# frozen_string_literal: true

require_relative "ipgeobase/version"
require 'net/http'
require 'happymapper'
module Ipgeobase
  class Error < StandardError; end
  def self.lookup(ip)
    data = get_data(ip)

    parsed_data = HappyMapper.parse(data)

    parsed_data
  end

  private
  def self.get_data(ip)
    url = URI.parse("http://ip-api.com/xml/#{ip}")

    req = Net::HTTP::Get.new(URI.parse("http://ip-api.com/xml/#{ip}"))

    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}

    res.body
  end
end
