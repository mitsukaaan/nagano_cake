class Admin::ItemsController < ApplicationController

    def new
        @item =Item.new
        @genre =Genre.all

    end

    def index
        @items = Item.all
    end

    def create
        item = Item.new(item_params)
        item.save!
        redirect_to '/admin/items'
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def item_params
        params.require(:item).permit(:name,:introduction,:genre_id,:price,:is_active,:image)
    end

end
