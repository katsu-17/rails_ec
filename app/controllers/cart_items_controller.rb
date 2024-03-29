# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    chosen_item = Item.find(params[:item_id])

    if current_cart.items.include?(chosen_item)
      @cart_item = current_cart.cart_items.find_by(item_id: chosen_item.id)
      @cart_item.num += 1
    else
      @cart_item = current_cart.cart_items.build(cart_item_params)
    end

    if @cart_item.save
      flash[:success] = '商品をカートに入れました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'カートに登録できませんでした。'
      render 'items/index'
    end
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
