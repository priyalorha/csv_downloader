# frozen_string_literal: true

require 'csv'

class CsvGeneratorService
  attr_accessor :user_id, :user, :header

  def initialize(user_id, header)
    @user_id = user_id
    @user = User.find(user_id)
    @header = header
  end

  def call
    return unless user

    filename = "tmp/user_#{user.username}_orders_#{Date.today}.csv"
    generate_csv(fetch_order, filename)
  end

  def fetch_order
    user_orders = user.orders.includes(:product)
    user_orders.map do |order|
      [order.user.username, order.user.email, order.product.code, order.product.name, order.product.category,
       order.order_date]
    end
  end

  def generate_csv(data, filename)
    CSV.open(filename, 'wb') do |csv|
      csv << header
      data.each do |row|
        csv << row
      end
    end
  end
end
