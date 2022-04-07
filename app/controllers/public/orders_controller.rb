class Public::OrdersController < ApplicationController
    def thanks
    end

    def new
        @order = Order.new
        @customer = current_customer
        @addresses = Address.all
        @address = Address.new
    end

    def confirm
    end

    def create
        order = Order.new(order_params)
        order.save
        redirect_to '/orders/confirm'
    end


    private


    def order_params
      params.require(:orders).permit(:customer_id,:name,:postal_code,:address,:payment_method)
    end






end
