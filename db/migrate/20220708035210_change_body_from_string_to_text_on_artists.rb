class ChangeBodyFromStringToTextOnArtists < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { change_column :artists, :biography, :text }
      dir.down { change_column :artists, :biography, :string }
    end
  end
end
