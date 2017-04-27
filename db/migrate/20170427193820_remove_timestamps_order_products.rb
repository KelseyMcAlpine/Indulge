class RemoveTimestampsOrderProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_products, :created_at
    remove_column :order_products, :updated_at
  end
end
