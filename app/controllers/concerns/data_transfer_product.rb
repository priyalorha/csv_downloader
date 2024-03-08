# frozen_string_literal: true

require 'csv'

module DataTransferProduct
  extend ActiveSupport::Concern

  require 'csv'
  # Path to your CSV files
  PRODUCTS_CSV_FILE = '/Users/priya/Downloads/products.csv'

  # Import products from CSV
  CSV.foreach(PRODUCTS_CSV_FILE, headers: true) do |row|
    Product.create!(
      code: row['CODE'],
      name: row['NAME'],
      category: row['CATEGORY']
    )
  end
end
