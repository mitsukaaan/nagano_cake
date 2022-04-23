class Admin::OrderDetailsController < ApplicationController

    def update
        order = Order.find(params[:order_id])
        order_detail = order.order_details.find(params[:id])
        order_detail.update(order_detail_params)
        if params[:order_detail][:making_status] == "make_now"
            order_detail.order.status = "making"
            order_detail.order.save
        elsif params[:order_detail][:making_status] == "make_done"
            order_detail.order.status = "before_sent"
            order_detail.order.save
        end
        redirect_to admin_order_path(order.id)

    end

    private

    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end
end