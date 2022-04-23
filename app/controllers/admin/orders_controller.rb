class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        if params[:order][:status] == "payment_confirm"
          order.order_details.each do |order_detail|
          order_detail.making_status = "make_wait"
          order_detail.save
          end
        end
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
