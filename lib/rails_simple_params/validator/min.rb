# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Min < Validator
      def valid_value?
        value.nil? || options[:min] <= value
      end

      private

      def error_message
        "#{name} cannot be less than #{options[:min]}"
      end

      def exception_class
        TooSmall
      end
    end
  end
end
