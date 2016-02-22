class RemovePlaidPublicTokenFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :plaid_public_token
  end
end
