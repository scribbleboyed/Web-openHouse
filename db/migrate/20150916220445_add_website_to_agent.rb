class AddWebsiteToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :website, :string
  end
end
