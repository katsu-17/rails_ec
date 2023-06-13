# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :carts_items, dependent: :destroy
end
