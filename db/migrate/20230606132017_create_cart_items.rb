# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[7.0]
  def up
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: { on_delete: :cascade }
      t.references :item, null: false, foreign_key: true
      t.integer :num, null: false

      t.timestamps
    end
  end

  def down
    drop_table :cart_items
  end
end
