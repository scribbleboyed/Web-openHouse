class CreateEventProspects < ActiveRecord::Migration
  def change
    create_table :event_prospects do |t|
      t.references :event, index: true, foreign_key: true
      t.references :prospect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
