# frozen_string_literal: true

class OrderDetailMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def order_detail_email
    @order = params[:order]
    mail(to: @order.email, subject: 'ご注文ありがとうございます')
  end
end
