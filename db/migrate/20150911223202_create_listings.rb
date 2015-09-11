class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :sqft
      t.string :bed
      t.string :bath
      t.string :description
      t.string :image_url
      t.references :agent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
