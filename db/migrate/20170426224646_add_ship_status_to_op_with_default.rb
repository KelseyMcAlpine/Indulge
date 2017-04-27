class AddShipStatusToOpWithDefault < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_products, :ship_status
    add_column :order_products, :ship_status, :string, :default => "Not Shipped"

  end
end
