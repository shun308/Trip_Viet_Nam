class AddIntonationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :intonation, :string
  end
end
