class Admin::ItemsController < ApplicationController
    
    def new
        @item =Item.new
        @genre = Genre.all
        
    end 
    
    def index 
    end 
    
    def create
    end 
    
    def show
    end 
    
    def edit
    end 
    
    def update
    end 
    
end
