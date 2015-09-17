class AddEventTypeToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :event_type, :string
  end
end
