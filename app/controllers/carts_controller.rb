# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart = @current_cart
  end

  def destroy; end
end
