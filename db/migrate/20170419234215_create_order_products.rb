class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_products do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
