class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :japanese
      t.string :vietnamese
      t.string :intonation
      t.timestamps
    end
  end
end
