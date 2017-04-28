class AddHeaderToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :header, :string
  end
end
