class AddReferenceToOrder < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { add_reference :orders, :customer, null: false, foreign_key: true }
      dir.down { remove_reference :orders, :customer }
    end
  end
end
