class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|
      t.string :name
      t.decimal :amount
      t.string :type
      t.timestamps
    end
  end
end
