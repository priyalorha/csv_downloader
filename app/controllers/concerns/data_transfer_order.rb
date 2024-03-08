# frozen_string_literal: true

require 'csv'

module DataTransferProduct
  extend ActiveSupport::Concern

  # Path to your CSV files
  ORDER_CSV_FILE = '/Users/priya/Downloads/order_details.csv'

  CSV.foreach(ORDER_CSV_FILE, headers: true) do |row|
    print(row['EMAIL'])
    user = User.find_by(email: row['USER_EMAIL'])
    product = Product.find_by(code: row['PRODUCT_CODE'])
    print(user, product)

    if user && product
      Order.create!(
        user_id: user.id,
        product_id: product.id,
        order_date: row['ORDER_DATE']
      )
    end
  end
end
