class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :artists do |t|
          t.string :name
          t.string :nationality
          t.date :birth_date
          t.date :death_day
    
          t.timestamps
        end
      end
      dir.down do
        drop_table :artists
      end
    end
  end
end