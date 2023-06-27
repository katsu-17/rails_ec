# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  enum :status, { unused: 1, used: 2 }
end
