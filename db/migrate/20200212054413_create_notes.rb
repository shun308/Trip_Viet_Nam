class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :memo
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
