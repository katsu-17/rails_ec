# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @related_items = Item.order(id: :desc).limit(4)
  end
end
