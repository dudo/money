class AddPublicTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :public_token, :string
  end
end
