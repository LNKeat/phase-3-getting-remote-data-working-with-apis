require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class GetRequester
  attr_reader  :URL

  def initialize(URL)
    @URL = URL
  end

  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    # ap JSON.parse(response.body)
  end



end