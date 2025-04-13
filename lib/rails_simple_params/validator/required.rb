# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Required < Validator
      private

      def valid_value?
        !(value.nil? && options[:required])
      end

      def error_message
        "Parameter #{name} is required"
      end
    end
  end
end
