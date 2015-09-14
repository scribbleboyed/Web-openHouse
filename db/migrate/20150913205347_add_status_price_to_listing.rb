class AddStatusPriceToListing < ActiveRecord::Migration
  def change
    add_column :listings, :status, :string
    add_column :listings, :price, :integer
  end
end
