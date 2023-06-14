# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    current_cart_items
  end

  def create
    session[:cart_id] = Cart.create!.id if session[:cart_id].nil?
    unit_price = Item.find(cart_item_params[:item_id]).price
    cart = Cart.find(session[:cart_id])
    cart_item = cart.cart_items.build(cart_item_params)
    cart_item.unit_price = unit_price
    cart_item.total_price = unit_price * cart_item_params[:num].to_i

    cart_item.save!

    flash[:success] = '商品をカートに入れました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def cart_item_params
    params.permit(:item_id, :num)
  end
end
