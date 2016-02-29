class Api::Plaid

  def initialize(token, api_levels: [])
    @api_levels = api_levels
    @user = Plaid.set_user(token, api_levels)
  end

  %w(connect info auth).each do |l|
    define_method(l){ @user.get(l) }
  end

  def recent_transactions(type: 'checking')
    @recent_transactions ||= transactions(
      begin_scan: (Date.today-1.month).beginning_of_month,
      end_scan: (Date.today-1.month).end_of_month,
      type: type
    )
  end

  def current_transactions(type: 'checking')
    @current_transactions ||= transactions(
      begin_scan: Date.today.beginning_of_month,
      end_scan: Date.today.end_of_month,
      type: type
    )
  end

  def transactions(begin_scan:, end_scan:, type:)
    # fetch tranactions for whole months
    @user.transactions.select do |t|
      (begin_scan .. end_scan).include?(Date.strptime(t.date, "%Y-%m-%d")) &&
      send("#{type}_accounts").include?(t.account)
    end
  end

  def available_balance
    @available_balance ||= accounts.map{ |a| a.available_balance }.sum
  end

private

  def checking_accounts
    @checking ||= @user.accounts.select{ |a| ['checking', 'prepaid', nil].include?(a.subtype) }.map(&:id)
  end

  def savings_accounts
    @savings ||= @user.accounts.select{ |a| %w(savings).include?(a.subtype) }.map(&:id)
  end

  def credit_accounts
    @credit ||= @user.accounts.select{ |a| %w(credit).include?(a.type) }.map(&:id)
  end

end