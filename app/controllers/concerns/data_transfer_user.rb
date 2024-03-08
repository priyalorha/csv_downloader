# frozen_string_literal: true

module DataTransferOrder
  extend ActiveSupport::Concern

  require 'csv'

  # Path to your CSV files
  USERS_CSV_FILE = '/Users/priya/Downloads/users.csv'

  # Import users from CSV
  CSV.foreach(USERS_CSV_FILE, headers: true) do |row|
    User.create!(username: row['USERNAME'], email: row['EMAIL'], phone: row['PHONE'])
  end
end
