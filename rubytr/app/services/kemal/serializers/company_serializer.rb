module Kemal
  module Serializers
    class CompanySerializer < BaseSerializer
      def serialize
        @data.each do |company|
          name   = company['name']
          city   = company['city']
          sector = company['sector']

          @company = Company.find_or_initialize_by(name: name)
          @company.update_attributes(city: city, sector: sector)
        end
      end
    end
  end
end
