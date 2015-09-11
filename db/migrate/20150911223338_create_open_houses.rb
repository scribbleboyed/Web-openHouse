class CreateOpenHouses < ActiveRecord::Migration
  def change
    create_table :open_houses do |t|
      t.references :listing, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :notes

      t.timestamps null: false
    end
  end
end
