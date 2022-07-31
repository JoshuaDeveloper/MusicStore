class AddReferenceToAlbumsOrder < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_reference :albums_orders, :album, null: false, foreign_key: true
        add_reference :albums_orders, :order, null: false, foreign_key: true
      end
      dir.down do
        remove_reference :albums_orders, :album
        remove_reference :albums_orders, :order
      end
    end
  end
end
