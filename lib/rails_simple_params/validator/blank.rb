# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Blank < Validator
      def valid_value?
        return false if parameter.options[:blank]

        case value
        when String
          (/\S/ === value) # rubocop:disable Style/CaseEquality
        when Array, Hash, ActionController::Parameters
          !value.empty?
        else
          !value.nil?
        end
      end

      private

      def error_message
        "Parameter #{name} cannot be blank"
      end
    end
  end
end
