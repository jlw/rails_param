# frozen_string_literal: true

module RailsSimpleParams
  def param!(name, type, options = {}, &)
    ParamEvaluator.new(params).param!(name, type, options, &)
  end
end
