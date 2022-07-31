class CreateAlbumsOrders < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :albums_orders do |t|
          t.integer :sub_total
          t.integer :album_quantity
    
          t.timestamps
        end
      end
      dir.down do
        drop_table :albums_orders
      end
    end
  end
end