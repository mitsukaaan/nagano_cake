class Admin::ItemsController < ApplicationController

    def new
        @item =Item.new
        @genre =Genre.all
    end

    def index
        @items = Item.all
        @genres = Genre.all
    end

    def create
        item = Item.new(item_params)
        item.save!
        redirect_to admin_item_path(item.id)
    end

    def show
        @item = Item.find(params[:id])
        @genre = @item.genre.name
    end



    def edit
        @item = Item.find(params[:id])
        @genre = Genre.all
    end

    def update
        item = Item.find(params[:id])
        item.update(item_params)
        redirect_to admin_item_path(item.id)
    end

    private

    def item_params
        params.require(:item).permit(:name,:introduction,:genre_id,:price,:is_active,:image)
    end

end
