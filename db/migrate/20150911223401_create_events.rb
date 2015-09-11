class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :notes

      t.timestamps null: false
    end
  end
end
