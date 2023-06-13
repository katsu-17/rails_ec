# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    current_cart
  end

  def create
    num = params[:num]
    item_id = params[:item_id]
    unit_price = Item.find(item_id).price
    session[:cart_id] = Cart.create!.id if session[:cart_id].nil?
    cart_item = CartItem.new(cart_id: session[:cart_id], item_id: item_id, num: num, unit_price: unit_price,
                             total_price: unit_price * num.to_i)
    return unless cart_item.save

    flash[:success] = '商品をカートに入れました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
