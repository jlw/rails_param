# frozen_string_literal: true

module RailsSimpleParams
  class ParamEvaluator
    attr_accessor :params

    def initialize(params, context = nil)
      @params = params
      @context = context
    end

    def param!(name, type, options = {}, &) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
      name = name.to_s unless name.is_a?(Integer)
      return unless params.include?(name) || check_param_presence?(options[:default]) || options[:required]

      parameter_name = @context ? "#{@context}[#{name}]" : name
      coerced_value = coerce(parameter_name, params[name], type, options)

      parameter = RailsSimpleParams::Parameter.new(
        name: parameter_name,
        value: coerced_value,
        type: type,
        options: options,
        &
      )

      parameter.set_default if parameter.should_set_default?

      # validate presence
      if params[name].nil? && options[:required]
        raise InvalidParameterError.new(
          "Parameter #{parameter_name} is required",
          param: parameter_name,
          options: options
        )
      end

      recurse_on_parameter(parameter, &) if block_given?

      # apply transformation
      parameter.transform if options[:transform]

      # validate
      validate!(parameter)

      # set params value
      params[name] = parameter.value
    end

    private

    def recurse_on_parameter(parameter, &) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      return if parameter.value.nil?

      if parameter.type == Array
        parameter.value.each_with_index do |element, i|
          if element.is_a?(Hash) || element.is_a?(ActionController::Parameters)
            recurse(element, "#{parameter.name}[#{i}]", &)
          else
            parameter.value[i] = recurse({ i => element }, parameter.name, i, &) # supply index as key unless value is hash
          end
        end
      else
        recurse(parameter.value, parameter.name, &)
      end
    end

    def recurse(element, context, index = nil)
      raise InvalidParameterError, 'no block given' unless block_given?

      yield(ParamEvaluator.new(element, context), index)
    end

    def check_param_presence?(param)
      !param.nil?
    end

    def coerce(param_name, param, type, options = {})
      return nil if param.nil?
      return param if begin
        param.is_a?(type)
      rescue StandardError
        false
      end

      Coercion.new(param, type, options).coerce
    rescue ArgumentError, TypeError
      raise InvalidParameterError.new("'#{param}' is not a valid #{type}", param: param_name)
    end

    def validate!(param)
      param.validate
    end
  end
end
