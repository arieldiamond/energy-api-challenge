require 'rails_helper'

describe Grape::API do
  context 'Arcadia::API Base Tests:' do
    it 'returns status 200 if valid' do
      get '/api/v1/users'
      expect(response.status).to eq(200)
    end

    # TO DO: add better error status handling
    xit 'returns status 404 if invalid' do
      get '/api/v1/userzzz'
      expect(response.status).to eq(404)
    end
  end
end
