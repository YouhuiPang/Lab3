class AdaptUserModelForDevise < ActiveRecord::Migration[7.1]
  def change
    # Check if the column needs renaming (if it hasn't been done already)
    if column_exists?(:users, :password_digest) && !column_exists?(:users, :encrypted_password)
      rename_column :users, :password_digest, :encrypted_password
    end

    # Ensure the email is indexed and unique
    unless index_exists?(:users, :email, unique: true)
      add_index :users, :email, unique: true
    end

    # Add necessary Devise columns if they do not exist
    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
      add_index :users, :reset_password_token, unique: true
    end

    unless column_exists?(:users, :reset_password_sent_at)
      add_column :users, :reset_password_sent_at, :datetime
    end

    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end
  end
end
