# frozen_string_literal: true

module RailsSimpleParams
  class Coercion
    class Base
      attr_reader :param, :options, :type

      def initialize(param:, options: nil, type: nil)
        @param = param
        @options = options
        @type = type
        argument_validation
      end

      def coerce
        raise NotImplementedError, "you must implement #coerce in #{self.class.name}"
      end

      private

      def argument_validation; end
    end
  end
end
