# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Max < Validator
      def valid_value?
        value.nil? || options[:max] >= value
      end

      private

      def error_message
        "Parameter #{name} cannot be greater than #{options[:max]}"
      end
    end
  end
end
