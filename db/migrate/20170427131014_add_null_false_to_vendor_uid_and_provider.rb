class AddNullFalseToVendorUidAndProvider < ActiveRecord::Migration[5.0]
  def change
    change_column_null :vendors, :uid, false
    change_column_null :vendors, :provider, false
  end
end
