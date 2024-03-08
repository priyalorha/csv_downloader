# frozen_string_literal: true

# app/services/csv_generator.rb

module CsvGenerator
  extend ActiveSupport::Concern
  require 'csv'

  def self.generate(data, headers)
    CSV.generate(headers: true) do |csv|
      csv << headers
      data.each do |record|
        csv << record.attributes.values_at(*headers)
      end
    end
  end
end
