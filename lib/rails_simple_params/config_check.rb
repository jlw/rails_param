# frozen_string_literal: true

module RailsSimpleParams
  class ConfigCheck
    PARAM_TYPE_MAPPING = {
      Integer => IntegerParam,
      Float => FloatParam,
      String => StringParam,
      Array => ArrayParam,
      Hash => HashParam,
      BigDecimal => BigDecimalParam,
      Date => TimeParam,
      DateTime => TimeParam,
      Time => TimeParam,
      TrueClass => BooleanParam,
      FalseClass => BooleanParam,
      boolean: BooleanParam
    }.freeze

    def initialize(param, type, options)
      klass_for(type).new(param: param, options: options, type: type)
    end

    private

    def klass_for(type)
      klass = PARAM_TYPE_MAPPING[type]
      return klass if klass

      raise TypeError
    end
  end
end
