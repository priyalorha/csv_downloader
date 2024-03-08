# frozen_string_literal: true

class CsvGenerator
  require 'csv'

  def self.generate(filename, headers, data)
    CSV.generate(filename, 'w', headers: true) do |csv|
      csv << headers
      data.each do |record|
        csv << record
      end
    end
  end
end
