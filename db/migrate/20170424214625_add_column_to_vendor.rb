class AddColumnToVendor < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :uid, :integer
    add_column :vendors, :provider, :string
  end
end
