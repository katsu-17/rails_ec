# frozen_string_literal: true

namespace :promotion_code do
  desc 'Insert records into promotion_codes'
  task generate: :environment do
    records = []
    last_code = PromotionCode.last&.code&.slice(-4, 4).to_i + 1 || 1
    10.times do |i|
      num = (i + last_code).to_s.rjust(4, '0')
      hash = { code: "PRM#{num}", discount: "#{i + 1}00".to_i }
      records.push(hash)
    end

    begin
      ApplicationRecord.transaction do
        records.each do |record|
          PromotionCode.create!(
            code: record[:code],
            discount: record[:discount]
          )
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      p e
    end
  end
end
