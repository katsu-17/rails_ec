# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.total_price_per_item
    end
    sum
  end
end
