# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class FloatParam < Base
      private

      def configuration_validation
        reject :format
        reject :max_length
        reject :min_length
        validate_limits
        validate_allowed_options 'non-Numeric', ->(n) { n.is_a?(Numeric) }
      end
    end
  end
end
