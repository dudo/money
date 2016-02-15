class AddPositionToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :row_order, :integer
    add_index :buckets, :row_order
  end
end
