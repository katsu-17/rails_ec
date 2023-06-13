# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:id)
  end

  def show
    @item = Item.find(params[:id])
    @related_items = Item.order(id: :desc).limit(4)
  end
end
