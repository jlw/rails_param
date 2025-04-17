# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class MinLength < Validator
      def valid_value?
        value.nil? || options[:min_length] <= value.length
      end

      private

      def error_message
        "#{name} cannot be shorter than #{options[:min_length]} characters"
      end

      def exception_class
        TooShort
      end
    end
  end
end
