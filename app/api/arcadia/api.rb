require 'grape'

module Arcadia
  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    prefix :api

    use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :put, :options]
      end
    end

    # TO DO: `mount Auth::Base` for authentication
    mount V1::Base

    error_formatter :json, Grape::Formatter::ActiveModelSerializers
  end
end
