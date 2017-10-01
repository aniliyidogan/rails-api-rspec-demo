module Kemal
  module Serializers
    class BaseSerializer
      SerializeError = Class.new(StandardError)
      def initialize(data)
        @data = data
        raise SerializeError unless @data
      end
    end
  end
end
