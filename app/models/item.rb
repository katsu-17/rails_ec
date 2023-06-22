# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_integer: true }

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
end
