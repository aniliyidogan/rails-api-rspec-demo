module Kemal
  class BaseRequest
    def initialize(conn)
      @conn = conn
      @response = @conn.get do |req|
        req.url kemal_request_path
        req.headers['Content-Type'] = 'application/json'
      end

      parse_response
    end

    def local_save
      nil
    end

    def local_parse_response
      ''
    end

    def parse_response
      @parsed_response = JSON.parse(@response.body.force_encoding('UTF-8'))
      @parsed_response = @parsed_response[local_parse_response]
    end

    def save
      local_save.new(@parsed_response).serialize
    end
  end
end
