class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :albums do |t|
          t.string :name
          t.integer :price
          
          t.timestamps
        end
      end
      dir.down do
        drop_table :albums
      end
    end
  end
end
