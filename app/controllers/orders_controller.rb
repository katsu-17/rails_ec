# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.pay(session[:cart_id], order_params)
      OrderDetailMailer.with(order: Order.find_by(cart_id: session[:cart_id])).order_detail_email.deliver_later
      session[:cart_id] = nil
      flash[:success] = '購入ありがとうございます'
      redirect_to root_path
    else
      render 'carts/index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country, :state,
                                  :zip, :shipping_address_same_flg, :save_info_flg, :payment_type, :name_on_card,
                                  :credit_card_number, :expiration, :cvv)
  end
end
