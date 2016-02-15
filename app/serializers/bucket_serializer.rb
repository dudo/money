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
#
# Indexes
#
#  index_buckets_on_user_id  (user_id)
#

class BucketSerializer < ActiveModel::Serializer
  attributes :external_id, :name, :original_name, :amount, :type, :original_category,
             :fluctuation, :frequency, :percent_complete

end