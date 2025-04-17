# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class MaxLength < Validator
      def valid_value?
        value.nil? || options[:max_length] >= value.length
      end

      private

      def error_message
        "#{name} cannot be longer than #{options[:max_length]} characters"
      end

      def exception_class
        TooLong
      end
    end
  end
end
