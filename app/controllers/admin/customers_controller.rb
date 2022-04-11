class Admin::CustomersController < ApplicationController

    def index
        @customers = Customer.all
    end


    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        customer = Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to admin_customer_path(customer.id)
    end

    def show
      @customer = Customer.find(params[:id])
    end

    def customer_params
    params.require(:customer).permit(:last_name,:first_name,:postal_code,:address,:last_name_kana,:first_name_kana,:telephone_number,:email,:is_deleted)
    end

end
