class AddExternalIdToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :external_id, :string
  end
end
