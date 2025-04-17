# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    class HashParam < Base
      private

      def configuration_validation
        reject :format
        reject :in
        reject :max
        reject :max_length
        reject :min
        reject :min_length
      end
    end
  end
end
