class AddUserToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :user_id, :integer

    add_index :buckets, :user_id
    add_index :users, :type
    add_index :users, :plaid_public_token
  end
end
