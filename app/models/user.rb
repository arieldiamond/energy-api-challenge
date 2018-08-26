class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true

	has_many :accounts
	has_many :bills, through: :accounts
end
