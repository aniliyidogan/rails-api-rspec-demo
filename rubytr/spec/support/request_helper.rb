module RequestHelpers
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module HeaderHelpers
    def header
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    end

    def header_with_token
      header.merge('Authorization' => "Token #{ENV['TOKEN']}")
    end
  end
end
