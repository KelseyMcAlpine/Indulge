class AddShipStatusToOrderProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :ship_status, :string
  end
end
