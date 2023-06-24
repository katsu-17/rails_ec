# frozen_string_literal: true

class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def up
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: { on_delete: :cascade }
      t.integer :item_id, null: false
      t.string :item_name, null: false
      t.integer :price, null: false
      t.integer :num, null: false

      t.timestamps
    end
  end

  def down
    drop_table :order_details
  end
end
