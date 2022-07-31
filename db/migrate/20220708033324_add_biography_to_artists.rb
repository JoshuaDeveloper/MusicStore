class AddBiographyToArtists < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :artists, :biography, :string
      end
      dir.down do
        remove_column :artists, :biography
      end
    end
  end
end
