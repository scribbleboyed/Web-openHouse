class AddAgentToProspect < ActiveRecord::Migration
  def change
    add_reference :prospects, :agent, index: true, foreign_key: true
  end
end
