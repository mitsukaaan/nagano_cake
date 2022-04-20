class CartItem < ApplicationRecord
    belongs_to:item
    belongs_to:customer
    has_one_attached :image
    has_many :item_total_price
    validates :amount, presence: true

    def item_total_price
        cart_item.price*cart_item.amount
    end
end
