require 'rails_helper'
require 'json'

describe Grape::API do
  context 'Arcadia::V1::Accounts Base Tests:' do
    user = User.create(email: Faker::Internet.email)
    account = user.accounts.create
    it 'returns array of accounts' do
      get '/api/v1/accounts'
      expect(JSON.parse(response.body)).to be_a_kind_of(Array)
    end
    # TO DO: more tests
  end
end
