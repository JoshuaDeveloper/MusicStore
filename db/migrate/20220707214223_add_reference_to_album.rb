class AddReferenceToAlbum < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { add_reference :albums, :artist, null: false, foreign_key: true }
      dir.down { remove_reference :albums, :artist }
    end
  end
end
