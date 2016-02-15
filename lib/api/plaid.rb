class Api::Plaid

  def initialize(token, api_levels: [])
    @api_levels = api_levels
    @user = Plaid.set_user(token, api_levels)
  end

  %w(connect info auth).each do |l|
    define_method(l){ @user.get(l) }
  end

  def recent_transactions
    @recent_transactions ||= transactions(
      begin_scan: (Date.today-1.month).beginning_of_month,
      end_scan: (Date.today-1.month).end_of_month
    )
  end

  def current_transactions
    @current_transactions ||= transactions(
      begin_scan: Date.today.beginning_of_month,
      end_scan: Date.today.end_of_month
    )
  end

  def transactions(begin_scan:, end_scan:)
    # fetch tranactions for whole months
    @user.transactions.select do |t|
      (begin_scan .. end_scan).include?(Date.strptime(t.date, "%Y-%m-%d"))
    end
  end

  def available_balance
    @available_balance ||= @user.accounts.map{ |a| a.available_balance }.sum
  end
end