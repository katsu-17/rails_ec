# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def up
    create_table :promotion_codes do |t|
      t.string :code, null: false
      t.integer :discount, null: false
      t.integer :status, limit: 2, default: 1, null: false

      t.timestamps
    end
  end

  def down
    drop_table :promotion_codes
  end
end
