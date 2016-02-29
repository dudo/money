# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  type                   :string
#  public_token           :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_type                  (type)
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email,
             :income_info, :fixed_cost_info, :financial_goal_info, :flexible_spending_info

  has_many :actual_flexible_spendings
  has_many :buckets

  def income_info
    {
      actual: object.actual_incomes_amount,
      monthly: object.monthly_income_amount
    }
  end

  def fixed_cost_info
    {
      actual: object.actual_fixed_costs_amount,
      monthly: object.allotted_monthly_fixed_costs_amount
    }
  end

  def financial_goal_info
    {
      actual: object.actual_financial_goals_amount,
      monthly: object.allotted_monthly_financial_goals_amount
    }
  end

  def flexible_spending_info
    {
      actual: object.actual_flexible_spendings_amount,
      monthly: object.allotted_monthly_flexible_spendings_amount
    }
  end
end
