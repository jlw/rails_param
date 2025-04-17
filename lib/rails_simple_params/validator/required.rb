# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Required < Validator
      private

      def valid_value?
        !(value.nil? && options[:required])
      end

      def error_message
        "#{name} is required"
      end

      def exception_class
        MissingParameter
      end
    end
  end
end
