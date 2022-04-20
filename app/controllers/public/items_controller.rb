class Public::ItemsController < ApplicationController
    before_action :authenticate_customer!,except: [:index,:show]

    def index
      @items = Item.all
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
