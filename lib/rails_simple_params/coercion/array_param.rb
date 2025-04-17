# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class ArrayParam < Base
      def coerce
        return param if param.is_a?(Array)

        Array(param.split(options[:delimiter] || ','))
      end

      private

      def argument_validation
        raise ArgumentError unless type == Array
        raise ArgumentError unless param.respond_to?(:split)
      end
    end
  end
end
