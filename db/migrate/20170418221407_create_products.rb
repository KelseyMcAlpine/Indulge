class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :vendor
      t.float :price
      t.integer :inventory
      t.string :name
      t.text :description
      t.string :photo_url
      t.string :lifecycle
      t.timestamps
    end
  end
end
