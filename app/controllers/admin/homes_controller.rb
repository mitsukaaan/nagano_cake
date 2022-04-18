class Admin::HomesController < ApplicationController
def top
    @orders = Order.all
    @order_details = OrderDetails.all
end

end
