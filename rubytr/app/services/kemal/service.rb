module Kemal
  class Service
    def self.get(service_name)
      url = Kemal::Params::ROOT_PATH

      @conn = Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end

      response = "Kemal::#{service_name.camelize}".constantize.new(@conn)
      response.save
    end
  end
end
