# frozen_string_literal: true

class Order < ApplicationRecord
  include CommonModule

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
    sum = 0
    order_details.each do |order_detail|
      sum += order_detail.total_price_per_item
    end
    sum
  end
end
