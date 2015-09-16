class AddAgentListingProspectToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :agent, index: true, foreign_key: true
    add_reference :events, :listing, index: true, foreign_key: true
    add_reference :events, :prospect, index: true, foreign_key: true
  end
end
