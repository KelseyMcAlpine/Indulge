class PriceDecimalChange < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :float, :precision => 2
  end
end
