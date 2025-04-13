# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Is < Validator
      def valid_value?
        value === options[:is] # rubocop:disable Style/CaseEquality
      end

      private

      def error_message
        "Parameter #{name} must be #{options[:is]}"
      end
    end
  end
end
