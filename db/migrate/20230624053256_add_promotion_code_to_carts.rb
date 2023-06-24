# frozen_string_literal: true

class AddPromotionCodeToCarts < ActiveRecord::Migration[7.0]
  def up
    add_column :carts, :promotion_code, :string
  end

  def down
    remove_column :carts, :promotion_code, :string
  end
end
