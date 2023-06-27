# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @order = Order.new
    return if params[:code].blank?

    if PromotionCode.find_by(code: params[:code])&.unused?
      cart = Cart.find(session[:cart_id])
      cart.promotion_code = params[:code]
      if cart.save
        redirect_to carts_path
      else
        flash.now[:danger] = 'エラーが発生しました。もう一度入力してください。'
        render 'index', status: :unprocessable_entity
      end
    else
      flash.now[:danger] = '入力されたプロモーションコードは無効です'
      render 'index', status: :unprocessable_entity
    end
  end

  def destroy; end
end
