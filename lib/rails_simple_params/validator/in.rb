# frozen_string_literal: true

module RailsSimpleParams
  class Validator
    class In < Validator
      def valid_value?
        value.nil? || inclusion_group.include?(value)
      end

      private

      def error_message
        "#{parameter.name} must be #{inclusion_group.is_a?(Range) ? 'within' : 'one of'} #{inclusion_group}"
      end

      def exception_class
        inclusion_group.is_a?(Range) ? OutOfRange : InvalidOption
      end

      def inclusion_group
        return options[:in].call if options[:in].respond_to?(:call)

        options[:in]
      end
    end
  end
end
