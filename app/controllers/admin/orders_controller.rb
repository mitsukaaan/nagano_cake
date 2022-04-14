class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        redirect_to admin_order_path(order.id)
    end

    def index
      @orders = Order.all
      @order_details =OrderDetail.all
    end


private

 def order_params
     params.require(:order).permit(:last_name,:first_name,:postal_code,:address,:payment_method,:status,:amount)
 end


end
