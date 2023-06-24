# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @order = Order.new
  end

  def destroy; end
end
