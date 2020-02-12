class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.string :japanese_conversation
      t.string :vietnamese_conversation
      t.string :intonation_conversation
      t.timestamps
    end
  end
end
