class Public::ItemsController < ApplicationController

    def index
    @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = current_customer
        
    end
end
