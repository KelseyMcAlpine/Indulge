class RenameTableOrdersProductsToOrderProducts < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :orders_products, :order_products
  end

end
