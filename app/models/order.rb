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

  def discount
    PromotionCode.find_by(code: promotion_code).discount
  end

  def total_price
    sum = order_details.inject(0) { |result, order_detail| result + order_detail.total_price_per_item }
    sum -= discount if promotion_code
    sum
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
    use_promotion_code(cart_id) if Cart.find(cart_id).promotion_code
  end

  def use_promotion_code(cart_id)
    promo_code = Cart.find(cart_id).promotion_code
    order = Order.last
    order.promotion_code = promo_code
    order.save
    promotion_code = PromotionCode.find_by(code: promo_code)
    promotion_code.status = :used
    promotion_code.save
  end
end
