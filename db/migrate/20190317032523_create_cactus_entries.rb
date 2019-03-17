class CreateCactusEntries < ActiveRecord::Migration
  def change
    create_table :cactus_entries do |t|

      t.timestamps null: false 
    end
  end
end
