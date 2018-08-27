module Arcadia
  module V1
    module Accounts
      class Base < Grape::API
        # TO DO: authentication for admins only
        resource :accounts do
          desc 'Returns all accounts and associated bills, which can be filtered by account type or utility'
          params do
            optional :account_type, type: String, desc: 'Account type: residential or commercial', values: ['residential', 'commercial']
            optional :utility, type: String, desc: 'Name of utility'
          end

          get do
            if params[:account_type]
              Account.where(account_type: params[:account_type])
            elsif params[:utility]
              Account.where(utility: params[:utility])
            else
              Account.all
            end
          end
        end
      end
    end
  end
end
