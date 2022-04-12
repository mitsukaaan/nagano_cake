class Public::OrdersController < ApplicationController


    def new
        @order = Order.new
        @customer = current_customer
        @addresses = Address.all
        @address = Address.new
    end

    def confirm
        @cart_items = current_customer.cart_items.all
        @order = Order.new(order_params)



         if params[:order][:select_address]== "0"
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.last_name + current_customer.first_name

         elsif params[:order][:select_address]=="1"
          @list_address = Address.find_by(params[:order][:address_id])
          @order.postal_code = @list_address.postal_code
          @order.address = @list_address.address
          @order.name = @list_address.name
         end
    end

    def create
        order = Order.new(order_params)
        order.customer_id = current_customer.id
        order.save
        redirect_to orders_thanks_path
    end

    def thanks
    end

    def index
        @orders = Order.all
        @cart_item = current_customer.cart_items.all

    end


    private


    def order_params
      params.require(:order).permit(:customer_id,:name,:postal_code,:address,:payment_method,:total_price,:postage)
    end
end