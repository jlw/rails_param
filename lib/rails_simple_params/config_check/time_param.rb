# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class TimeParam < Base
      private

      def configuration_validation
        reject :in
        reject :max_length
        reject :min_length
      end
    end
  end
end
