class CreateChatAgents < ActiveRecord::Migration
  def change
    create_table :chat_agents do |t|
      t.references :chat, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
