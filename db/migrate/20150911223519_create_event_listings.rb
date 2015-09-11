class CreateEventListings < ActiveRecord::Migration
  def change
    create_table :event_listings do |t|
      t.references :event, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
