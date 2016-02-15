class AddOriginalPlaidNameToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :original_name, :string
  end
end
