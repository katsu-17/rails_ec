# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  before_action :current_cart

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    return unless session[:cart_id].nil?

    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id

    # cart = Cart.find(session[:cart_id]) if session[:cart_id]
    # if cart.present?
    #   @current_cart = cart
    # else
    #   @current_cart = Cart.create
    #   session[:cart_id] = @current_cart.id
    # end
  end
end
