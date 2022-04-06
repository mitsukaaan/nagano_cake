class Public::ItemsController < ApplicationController

    def index
      @items = Item.all
      #@item.customer_id = current_customer.id
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end

    private
    def item_params
        params.require(:items).permit(:genre_id,:name,:introduction,:price)
    end
end
