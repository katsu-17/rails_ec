# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.binary :thumbnail_image
      t.text :introduction

      t.timestamps
    end
  end
end
