require 'rails_helper'

RSpec.describe User, type: :model do
	context "Model Tests:" do
		subject(:user) { described_class.create(email: Faker::Internet.email) }

		it "is valid if it has a unique email" do
			expect(user).to be_valid
		end

		it "is not valid without an email" do
			invalid_user = User.new
			expect(invalid_user).not_to be_valid
		end

		it "is not valid without a unique email" do
			user1 = User.create(email: "bob.smith@hotmail.com")
			user2 = User.create(email: "bob.smith@hotmail.com")
			expect(user2).not_to be_valid
		end

		it "has many accounts" do
			user.accounts.create!
			user.accounts.create!
			expect(user.accounts.length).to eq(2)
		end

		it "has many bills through accounts" do
			account = user.accounts.create!
			account.bills.create!
			account.bills.create!
			expect(user.bills.length).to eq(2)
		end
	end
end
