class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
    	t.integer	:account_id
    	t.datetime :start_date
    	t.datetime :end_date
    	t.integer :usage
    	t.decimal :charges
    	t.string :status

      t.timestamps
    end
  end
end
