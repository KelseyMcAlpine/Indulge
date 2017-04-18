class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
