# frozen_string_literal: true

# app/workers/csv_generation_worker.rb

class CsvGenerationWorker
  include Sidekiq::Worker

  def perform(user_id)
    return unless user_id.present?

    user = User.find(user_id)

    user_orders = user.orders.includes(:product)

    headers = %w[USERNAME,USER_EMAIL,PRODUCT_CODE,PRODUCT_NAME,PRODUCT_CATEGORY,ORDER_DATE]
    data = user_orders.map do |order|
      [order.user.username, order.user.email, order.product.code, order.product.name, order.product.category,
       order.order_date]
    end

    filename = "user_#{user.username}_orders_#{Date.today}.csv"

    CsvGenerator.generate(filename, headers, data)

  end
end
