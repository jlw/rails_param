# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class StringParam < VirtualParam
      def coerce
        String(param)
      end
    end
  end
end
