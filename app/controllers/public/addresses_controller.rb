class Public::AddressesController < ApplicationController

    def new
        @address =Address.new
    end

    def index
        @addresses= Address.all
    end

    def edit
    end

    def create
        address = Address.new(address_params)
        address.save
        redirect_to address_path
    end


end
