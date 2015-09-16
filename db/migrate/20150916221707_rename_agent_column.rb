class RenameAgentColumn < ActiveRecord::Migration
  def change
  	rename_column :events, :agent, :meeting_agent
  end
end
