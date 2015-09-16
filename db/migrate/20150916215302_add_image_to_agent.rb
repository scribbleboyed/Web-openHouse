class AddImageToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :image_url, :string
  end
end
