class RemoveProductsCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :products_categories
  end
end
