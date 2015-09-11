class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.references :open_house, index: true, foreign_key: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
