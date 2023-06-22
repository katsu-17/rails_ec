# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = CartItem.where(cart_id: session[:cart_id])
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(
          order_id: @order.id,
          item_id: cart_item.item.id,
          item_name: cart_item.name,
          price: cart_item.price,
          num: cart_item.num
        )
        order_detail.save
      end
      OrderDetailMailer.with(order: @order).order_detail_email.deliver_later
      session[:cart_id] = nil
      flash[:success] = '購入ありがとうございます'
      redirect_to root_path
    else
      render 'carts/index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    columns = Order.column_symbolized_names
    params.require(:order).permit(*columns)
  end
end
