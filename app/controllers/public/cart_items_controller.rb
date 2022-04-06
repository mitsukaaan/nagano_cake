class Public::CartItemsController < ApplicationController

    def index
     @cart_items = CartItem.all


    end


    def create
        cart_item = CartItem.new(cart_item_params)
        cart_item.save
        redirect_to '/cart_items'
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id,:amount,:customer_id)
    end
end
