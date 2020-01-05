class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false #外部キー
      t.references :item, null:false #外部キー
      t.timestamps
    end
  end
end
