# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def total_price_per_item
    num * price
  end
end
