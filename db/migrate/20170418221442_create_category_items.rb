class CreateCategoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :category_items do |t|
      t.belongs_to :product
      t.belongs_to :category
      t.timestamps
    end
  end
end
