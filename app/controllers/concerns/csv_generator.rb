# frozen_string_literal: true

class CsvGenerator
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
