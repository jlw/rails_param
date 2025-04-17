# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class StringParam < Base
      private

      def configuration_validation
        reject :max
        reject :min
        validate_lengths
        validate_allowed_options 'non-String', ->(n) { n.is_a?(String) }
      end
    end
  end
end
