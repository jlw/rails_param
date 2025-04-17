# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class IntegerParam < Base
      private

      def configuration_validation
        reject :format
        reject :max_length
        reject :min_length
        validate_limits
        validate_allowed_options 'non-Integer', ->(n) { n.is_a?(Integer) }
      end
    end
  end
end
