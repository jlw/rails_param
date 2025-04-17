# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class IntegerParam < Base
      def coerce
        return nil if param == '' # e.g. from an empty field in an HTML form

        Integer(param)
      end
    end
  end
end
