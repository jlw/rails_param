# frozen_string_literal: true

require 'rails_simple_params/param'
Dir[File.join(__dir__, 'rails_simple_params/validator', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'rails_simple_params/coercion', '*.rb')].reverse_each { |file| require file }
Dir[File.join(__dir__, 'rails_simple_params', '*.rb')].each { |file| require file }

ActiveSupport.on_load(:action_controller) do
  include RailsSimpleParams
end
