# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class BigDecimalParam < Base
      private

      def configuration_validation
        reject :format
        reject :in, ' (use :min/:max)'
        reject :max_length
        reject :min_length
        validate_limits
      end
    end
  end
end
