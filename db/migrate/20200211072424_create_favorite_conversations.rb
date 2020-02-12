class CreateFavoriteConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_conversations do |t|
      t.references :user, null:false #外部キー
      t.references :conversation, null:false #外部キー
      t.timestamps
    end
  end
end
