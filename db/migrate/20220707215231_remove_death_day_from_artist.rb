class RemoveDeathDayFromArtist < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :death_day, :date
  end
end
