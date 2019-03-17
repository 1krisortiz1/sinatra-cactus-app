class CreateCactusEntries < ActiveRecord::Migration
  def change
    create_table :cactus_entries do |t|
      t.string :content 
      t.integer :user_id
      t.timestamps null: false 
    end
  end
end
