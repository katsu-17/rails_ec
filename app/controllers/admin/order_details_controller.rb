# frozen_string_literal: true

module Admin
  class OrderDetailsController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'pw'

    def index
      @orders = Order.all.order(id: :desc)
    end

    def show
      @order = Order.find(params[:id])
    end
  end
end
