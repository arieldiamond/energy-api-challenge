module Arcadia
  module V1
    module Users
      class Base < Grape::API
        # TO DO: authentication for both users and admins, with users having access only to their own data.

        resource :users do
          desc 'Returns all users and associated accounts and bills. Users can be looked up by email or by status (active/inactive)'
          params do
            optional :email, type: String, desc: 'User email'
            optional :status, type: String, desc: 'User status', values: ['active', 'inactive']
          end

          get do
            if params[:email]
              User.where(email: params[:email])
            elsif params[:status]
              User.where(status: params[:status])
            else
              User.all
            end
          end

          # TO DO: add endpoints to create a new user as well as functionality to update all fields

          desc 'Returns one user by id'
          params do
            requires :user_id, type: Integer, desc: 'User id'
          end

          route_param :user_id do
            get do
              User.find(params[:user_id])
            end

            get 'accounts' do
              User.find(params[:user_id]).accounts
            end

            desc 'returns array of unpaid bills'
            get 'payment_due' do
              User.find(params[:user_id]).bills.where(status: 'unpaid')
            end

            desc 'Updates status of paid bill'
            put 'payment' do
              params do
                required :bill_id, type: Integer, desc: 'Id of bill to pay'
              end
              unpaid_bill = Bill.find(params[:bill_id])
              unpaid_bill.update(status: 'paid')
              { message: "Status of bill with id #{params[:bill_id]} has been updated to 'paid'."}
            end

            desc 'Updates status of user'
            put 'status' do
              params do
                required :status, type: String, desc: 'Updated user status', values: ['active', 'inactive']
              end

              User.find(params[:user_id]).update(status: params[:status])

              { message: "Status of user with id #{params[:user_id]} has been updated to #{params[:status]}."}
            end
          end
        end
      end
    end
  end
end
