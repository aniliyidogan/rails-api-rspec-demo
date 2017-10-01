module Kemal
  class Companies < BaseRequest
    def kemal_request_path
      Kemal::Params::COMPANIES_PATH
    end

    def local_save
      Kemal::Serializers::CompanySerializer
    end

    def local_parse_response
      'companies'
    end
  end
end
