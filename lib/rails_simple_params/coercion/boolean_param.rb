# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class BooleanParam < VirtualParam
      FALSEY = /^(false|f|no|n|0)$/i
      TRUTHY = /^(true|t|yes|y|1)$/i

      def coerce
        return false if FALSEY === param.to_s
        return true if TRUTHY === param.to_s

        raise ArgumentError
      end
    end
  end
end
