# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'grape-active_model_serializers'
ActiveModelSerializers.config.adapter = :json
ActiveModelSerializers.config.default_includes = '**'

run Rails.application
