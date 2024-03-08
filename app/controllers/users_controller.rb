# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def download_csv
    user = User.find(params[:id])
    user_orders = user.orders.includes(:product)

    headers = %s(USERNAME USER_EMAIL PRODUCT_CODE PRODUCT_NAME PRODUCT_CATEGORY ORDER_DATE)

    # Fetch all products associated with orders of the user
    user_orders.map do |order|
      [order.user.user_name, order.user.email, order.product_code, 
      order.product.name, order.product.category,
       order.order_date]
    end
    CsvGenerator.generate(user_orders, [headers])

    user_orders
    # send_data user_orders.to_csv, filename: "#{user.username}_and_orders-#{Date.today}.csv"
  end
end
