class AddFluctuationToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :fluctuation, :integer, default: 10
    add_column :buckets, :frequency, :integer, default: 1
  end
end
