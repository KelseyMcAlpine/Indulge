class AddImageToCategoryAndVendor < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :image_url, :string
    add_column :categories, :image_url, :string
  end
end
