# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.0]
  def up
    create_table :carts, &:timestamps
  end

  def down
    drop_table :carts
  end
end
