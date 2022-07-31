class AddReferenceToSong < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { add_reference :songs, :album, null: false, foreign_key: true }
      dir.down { remove_reference :songs, :album }
    end
  end
end
