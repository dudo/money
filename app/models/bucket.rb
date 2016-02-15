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

class Bucket < ApplicationRecord
  include RankedModel

  belongs_to :user

  ranks :row_order, with_same: :user_id

  scope :incomes, -> { where(type: 'Income') }
  scope :fixed_costs, -> { where(type: 'FixedCost') }
  scope :financial_goals, -> { where(type: 'FinancialGoal') }
  scope :flexible_spendings, -> { where(type: 'FlexibleSpending') }

  before_create :copy_name

  def included_transactions
    user.current_transactions.select do |t|
      t.name == original_name &&
      t.category_id.to_s == original_category.to_s &&
      (t.amount.abs-fluctuation .. t.amount.abs+fluctuation).include?(amount.to_f.abs)
    end
  end

  def percent_complete
    [included_transactions.size/frequency.to_f*100, 100].min
  end

private

  def copy_name
    self.original_name = self.name
  end

end
