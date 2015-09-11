class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
