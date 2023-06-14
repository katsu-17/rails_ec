# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_cart_items

  private

  def current_cart_items
    @cart_items = CartItem.includes(:item).where(cart_id: session[:cart_id])
  end
end
