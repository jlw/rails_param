# frozen_string_literal: true

require 'rails_simple_params/param'
require 'rails_simple_params/config_check/base'
Dir[File.join(__dir__, 'rails_simple_params/config_check', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'rails_simple_params/validator', '*.rb')].each { |file| require file }
require 'rails_simple_params/coercion/base'
Dir[File.join(__dir__, 'rails_simple_params/coercion', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'rails_simple_params', '*.rb')].each { |file| require file }

ActiveSupport.on_load(:action_controller) do
  include RailsSimpleParams
end
