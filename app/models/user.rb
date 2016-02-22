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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :buckets, -> { rank(:row_order) }, inverse_of: :user

  delegate :incomes, :fixed_costs, :financial_goals, to: :buckets

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def monthly_income_amount
    @monthly_income_amount ||= incomes.reorder(nil).pluck('sum(frequency * amount)')[0].to_f
  end

  def allotted_monthly_fixed_costs_amount
    monthly_income_amount * 0.5
  end

  def allotted_monthly_financial_goals_amount
    monthly_income_amount * 0.2
  end

  def allotted_monthly_flexible_spendings_amount
    monthly_income_amount * 0.3
  end

  def actual_incomes
    @actual_incomes ||= incomes.map{ |b| b.included_transactions }.flatten
  end

  def actual_incomes_amount
    actual_incomes.map{ |i| i.amount.abs }.sum
  end

  def actual_fixed_costs
    @actual_fixed_costs ||= fixed_costs.map{ |b| b.included_transactions }.flatten
  end

  def actual_fixed_costs_amount
     actual_fixed_costs.map(&:amount).sum
  end

  def actual_financial_goals
    @actual_financial_goals ||= financial_goals.map{ |b| b.included_transactions }.flatten
  end

  def actual_financial_goals_amount
    actual_financial_goals.map(&:amount).sum
  end

  def actual_flexible_spendings
    # this is array math, to remove objects from current_transactions
    @actual_flexible_spendings ||= current_transactions - actual_incomes - actual_fixed_costs - actual_financial_goals
  end

  def actual_flexible_spendings_amount
    actual_flexible_spendings.map(&:amount).sum
  end

  def current_transactions
    @current_transactions ||= plaid_user.current_transactions
  end

  def recent_transactions
    @recent_transactions ||= plaid_user.recent_transactions
  end

  def get_token
    @token ||= Plaid.exchange_token(public_token).access_token
  end

  def plaid_user(levels: %w(connect))
    @plaid_user ||= ::Api::Plaid.new(get_token, api_levels: levels)
    # call '#upgrade' on this object to promote api_level
  end

  # def set_bucket_defaults
  #   return unless public_token
  #   return if buckets.any?
  #   plaid_user.connect

  #   plaid_user.recurring_costs.each do |t|
  #     self.buckets << FixedCost.create(name: t.name, amount: t.amount, original_category: t.category)
  #   end
  #   plaid_user.recurring_payments.each do |t|
  #     self.buckets << FinancialGoal.create(name: t.name, amount: t.amount, original_category: t.category)
  #   end
  #   plaid_user.recurring_incomes.each do |t|
  #     self.buckets << Income.create(name: t.name, amount: t.amount.abs, original_category: t.category)
  #   end

  #   self
  # end

end
