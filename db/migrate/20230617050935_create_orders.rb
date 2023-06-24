# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def up
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email
      t.string :address, null: false
      t.string :address2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.boolean :shipping_address_same_flg, default: false, null: false
      t.boolean :save_info_flg, default: false, null: false
      t.integer :payment_type, default: 1, null: false
      t.string :name_on_card, null: false
      t.string :credit_card_number, null: false
      t.string :expiration, null: false
      t.string :cvv, null: false

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
