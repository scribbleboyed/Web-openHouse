class RemoveEventTypeFromAgent < ActiveRecord::Migration
  def change
    remove_column :agents, :event_type, :string
  end
end
