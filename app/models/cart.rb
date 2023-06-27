# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_one :order, dependent: :destroy

  def discount
    PromotionCode.find_by(code: promotion_code)&.discount || 0
  end

  def total_price
    sum = cart_items.inject(0) { |result, cart_item| result + cart_item.total_price_per_item }
    sum -= discount if promotion_code
    sum
  end
end
