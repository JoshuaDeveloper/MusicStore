class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        create_table :customers do |t|
          t.string :username
          t.string :email
          t.string :password
          t.string :name
          t.boolean :active_flag
    
          t.timestamps
        end
      end
      dir.down do
        drop_table :customers
      end
    end
  end
end
