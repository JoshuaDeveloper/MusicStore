class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :songs do |t|
          t.string :name
          t.integer :duration
    
          t.timestamps
        end
      end
      dir.down do
        drop_table :songs
      end
    end
  end
end
