# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  helper_method :current_cart

  private

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id]) if session[:cart_id]

    if @current_cart.nil?
      session[:cart_id] = nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

    @current_cart
  end
end
