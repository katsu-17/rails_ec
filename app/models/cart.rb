# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def total_price
    sum = cart_items.inject(0) { |result, cart_item| result + cart_item.total_price_per_item }
  end
end
