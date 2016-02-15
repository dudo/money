class BucketsController < ApplicationController

  def create
    @bucket = current_user.buckets.build(bucket_params)
    @bucket.row_order_position = params[:bucket][:index].to_i if params[:bucket][:index].present?
    head (@bucket.save ? :created : :gone)
  end

  def destroy
    @bucket = current_user.buckets.find_by_external_id(params[:id])
    @bucket.destroy
  end

  def update
    @bucket = current_user.buckets.find_by_external_id(params[:id])
    @bucket.assign_attributes(bucket_params.except(:original_category))
    @bucket.row_order_position = params[:bucket][:index].to_i if params[:bucket][:index].present?
    head (@bucket.save ? :created : :gone)
  end

private

  def bucket_params
    params[:bucket][:type] = params[:bucket][:type].classify if params[:bucket][:type]
    params.except(:controller, :action, :id, :index).
      require(:bucket).permit(:name, :amount, :type, :original_category, :external_id)
  end

end