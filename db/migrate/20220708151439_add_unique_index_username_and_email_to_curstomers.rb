class AddUniqueIndexUsernameAndEmailToCurstomers < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_index(:customers, :username, unique: true, name: 'custom_username')
        add_index(:customers, :email, unique: true, name: 'custom_email')
      end
      dir.down do
        remove_index :customers, :username, name: :custom_username
        remove_index :customers, :email, name: :custom_email
      end
    end
  end
end
