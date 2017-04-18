class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :purchase_date
      t.string :status
      t.string :cust_email
      t.string :cust_address
      t.integer :credit_card
      t.date :cc_expire
      t.timestamps
    end
  end
end
