class RenameOwner < ActiveRecord::Migration
  def change
  	rename_column :events, :owner, :agent
  end
end
