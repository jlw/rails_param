# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class StringParam < Base
      def coerce
        String(param)
      end
    end
  end
end
