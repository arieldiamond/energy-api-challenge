class Bill < ApplicationRecord
  validates :account_id, presence: true

  belongs_to :account
end
