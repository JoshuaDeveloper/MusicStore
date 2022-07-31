class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :orders do |t|
          t.date :date
          t.integer :total
    
          t.timestamps
        end
      end
      dir.down do
        drop_table :orders
      end
    end
  end
end