class AccountSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :utility,
             :account_type,
             :account_number

  has_many :bills
end
