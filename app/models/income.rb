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

class Income < Bucket

  before_create :make_positive

  def self.percent_filled(user)
    user.actual_incomes_amount / user.monthly_income_amount.to_f * 100
  end

  def calculated_amount
    [amount.to_f, included_transactions.map(&:amount).compact.sum.abs].max
  end

private

  def make_positive
    self.amount = amount.abs
  end

end
