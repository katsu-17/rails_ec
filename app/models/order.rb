# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :name_on_card, presence: true
  validates :credit_card_number, presence: true
  validates :expiration, presence: true
  validates :cvv, presence: true

  def total_price
    order_details.inject(0) { |result, order_detail| result + order_detail.total_price_per_item }
  end

  def pay(cart_id, order_params)
    order = Order.create(order_params)
    cart_items = CartItem.where(cart_id: cart_id)
    cart_items.each do |cart_item|
      OrderDetail.create(
        order_id: order.id,
        item_id: cart_item.item.id,
        item_name: cart_item.name,
        price: cart_item.price,
        num: cart_item.num
      )
    end
  end
end
