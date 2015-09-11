class CreateEventAgents < ActiveRecord::Migration
  def change
    create_table :event_agents do |t|
      t.references :event, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
