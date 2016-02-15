class AddCategoryToBuckets < ActiveRecord::Migration[5.0]
  def change
    add_column :buckets, :original_category, :string
  end
end
