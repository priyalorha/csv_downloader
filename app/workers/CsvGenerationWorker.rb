# frozen_string_literal: true

# app/workers/csv_generation_worker.rb

class CsvGenerationWorker
  include Sidekiq::Worker

  def perform(user_id, header)
    return unless user_id.present? && header.present?

    CsvGeneratorService.new(user_id, header).call
  end
end
