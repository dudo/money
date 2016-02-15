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

class FinancialGoal < Bucket

  def self.percent_filled(user)
    100 - user.actual_financial_goals_amount / user.allotted_monthly_financial_goals_amount.to_f * 100
  end
end
