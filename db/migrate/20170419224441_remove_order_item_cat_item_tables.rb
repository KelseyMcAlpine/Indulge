class RemoveOrderItemCatItemTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :order_items
    drop_table :category_items
  end
end
