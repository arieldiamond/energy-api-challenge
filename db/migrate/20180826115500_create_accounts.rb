class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
    	t.integer :user_id
    	t.string :utility
    	t.string :account_type
    	t.string :account_number

      t.timestamps
    end
  end
end

