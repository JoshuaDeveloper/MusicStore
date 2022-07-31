class AddDeathDateToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :death_date, :date
  end
end
