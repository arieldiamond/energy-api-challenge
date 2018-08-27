require 'rails_helper'
require 'json'

describe Grape::API do
  context 'Arcadia::V1::Users Base Tests:' do
    user = User.create(email: Faker::Internet.email)
    it 'returns array of users' do
      get '/api/v1/users'
      expect(JSON.parse(response.body)).to be_a_kind_of(Array)
    end
    # TO DO: more tests
  end
end
