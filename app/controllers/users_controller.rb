# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def download_csv
    headers = %w[USERNAME,USER_EMAIL,PRODUCT_CODE,PRODUCT_NAME,PRODUCT_CATEGORY,ORDER_DATE]

    CsvGenerationWorker.perform_async(params[:id], headers)
    render json: { status: 'pending' }
  end

  def check_csv_status
    # Check if the CSV file exists
    user = User.find(params[:id])
    filename = "tmp/user_#{user.username}_orders_#{Date.today}.csv"

    csv_exists = File.exist?(filename)

    render json: { csv_exists: csv_exists}
  end
end
