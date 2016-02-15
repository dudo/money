class FinancialAuthenticationsController < ApplicationController
  # before_action :authenticate_user!
  def create
    current_user.update_attribute(:public_token, params[:public_token])
    redirect_to current_user
  end

end
