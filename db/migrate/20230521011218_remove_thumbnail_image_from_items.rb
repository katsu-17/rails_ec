# frozen_string_literal: true

class RemoveThumbnailImageFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :thumbnail_image, :binary
  end
end
