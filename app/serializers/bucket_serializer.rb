# == Schema Information
#
# Table name: buckets
#
#  id                :integer          not null, primary key
#  name              :string
#  amount            :decimal(, )
#  type              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  original_name     :string
#  original_category :string
#  fluctuation       :integer          default(10)
#  frequency         :integer          default(1)
#  external_id       :string
#  row_order         :integer
#
# Indexes
#
#  index_buckets_on_row_order  (row_order)
#  index_buckets_on_user_id    (user_id)
#

class BucketSerializer < ActiveModel::Serializer
  attributes :external_id, :name, :original_name,
             :amount, :calculated_amount, :type, :original_category,
             :fluctuation, :calculated_fluctuation,
             :frequency, :calculated_frequency,
             :percent_complete

end
