class AddDurationToAlbums < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :albums, :duration, :integer
      end
      dir.down do
        remove_column :albums, :duration
      end
    end
  end
end
