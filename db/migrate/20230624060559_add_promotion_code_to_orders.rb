# frozen_string_literal: true

class AddPromotionCodeToOrders < ActiveRecord::Migration[7.0]
  def up
    add_column :orders, :promotion_code, :string
  end

  def down
    remove_column :orders, :promotion_code, :string
  end
end
