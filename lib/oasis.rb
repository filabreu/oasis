require "oasis/version"
require "oasis/request_snakelizer"
require "oasis/response_camelizer"

module Oasis
  def self.is_submit_request?(env)
    ['POST', 'PUT', 'PATCH'].include? env['REQUEST_METHOD']
  end
  
  def self.is_json_content?(env)
    env['CONTENT_TYPE'] == 'application/json'
  end
end
