require 'csv'
require 'json'

def make_object(file_name)
  object = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|
     object << row.to_hash
  end
  object
end

users = make_object('lib/data/users.csv')
accounts = make_object('lib/data/accounts.csv')
bills = make_object('lib/data/bills.csv')

User.create(users)

accounts.each do |account|
	# "type" is a reserved term so I had to rename it here.
	account[:account_type] = account.delete(:type)
	Account.create(account)
end

Bill.create(bills)
