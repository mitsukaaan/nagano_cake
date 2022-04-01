class Order < ApplicationRecord
    has_many:order_details,dependent: :destroy
    belongs_to:customer
    has_one_attached :image
end
