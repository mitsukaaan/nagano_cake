class Public::CartItemsController < ApplicationController

    def index
     @cart_items = current_customer.cart_items.all
    end


    def create
        cart_item = current_customer.cart_items.new(cart_item_params)
        cart_item.save
        redirect_to '/cart_items'
    end

    def destroy
        cart_item = current_customer.cart_items.find(params[:id])
        cart_item.destroy
        redirect_to '/cart_items'
    end

    def destroy_all
        cart_item = current_customer.cart_items.all
        cart_item.destroy_all
        redirect_to '/items'
    end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to '/cart_items'
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id,:amount,:customer_id)
    end
end
