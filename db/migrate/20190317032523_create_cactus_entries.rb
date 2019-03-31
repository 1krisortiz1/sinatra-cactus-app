class CreateCactusEntries < ActiveRecord::Migration
  def change
    create_table :cactus_entries do |t|
      t.string :location
      t.string :color_flowers
      t.string :water_conservation_method
      t.string :content 
      t.binary :image
      t.integer :user_id
      t.timestamps null: false 
    end
  end
end
