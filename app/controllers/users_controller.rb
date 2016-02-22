class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:buckets).find_by_id(params[:id])
    @serialized_user = ActiveModel::SerializableResource.new(@user)

    # render json: @user
    # render json: @user.current_transactions
    # render json: @user.recent_transactions
  end
end