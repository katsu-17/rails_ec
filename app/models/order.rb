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
    sum = order_details.inject(0) { |result, order_detail| result + order_detail.total_price_per_item }
  end
end
