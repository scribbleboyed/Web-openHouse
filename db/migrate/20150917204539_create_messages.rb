class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :agent, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true
      t.string :body
      t.boolean :read

      t.timestamps null: false
    end
  end
end
