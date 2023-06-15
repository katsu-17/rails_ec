# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  delegate :name,         to: :item
  delegate :introduction, to: :item

  def total_price_per_item
    num * item.price
  end
end
