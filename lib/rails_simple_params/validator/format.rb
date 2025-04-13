# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class Format < Validator
      TIME_TYPES = [Date, DateTime, Time].freeze
      STRING_OR_TIME_TYPES = ([String] + TIME_TYPES).freeze

      def valid_value?
        matches_time_types? || string_in_format?
      end

      private

      def error_message
        return "Parameter #{name} must be a string if using the format validation" unless matches_string_or_time_types?

        "Parameter #{name} must match format #{options[:format]}" unless string_in_format?
      end

      def matches_time_types?
        TIME_TYPES.any? { |cls| value.is_a? cls }
      end

      def matches_string_or_time_types?
        STRING_OR_TIME_TYPES.any? { |cls| value.is_a? cls }
      end

      def string_in_format?
        value =~ options[:format] && value.is_a?(String)
      end
    end
  end
end
