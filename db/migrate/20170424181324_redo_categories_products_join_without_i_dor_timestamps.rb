class RedoCategoriesProductsJoinWithoutIDorTimestamps < ActiveRecord::Migration[5.0]
  def change
    drop_table :categories_products

    create_table :categories_products, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true
    end

  end
end
