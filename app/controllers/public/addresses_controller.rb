class Public::AddressesController < ApplicationController

    def new
        @address =Address.new
    end

    def index
        @addresses= Address.all
    end

    def edit
    end
end
