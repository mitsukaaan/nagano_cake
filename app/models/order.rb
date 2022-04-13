class Order < ApplicationRecord
    has_many:order_details,dependent: :destroy
    belongs_to:customer
    has_one_attached :image
    enum payment_method: { credit_card: 0, transfer: 1 }
    #enum status: { waiting_payment: 0, payment_confirm: 1, making:2, before_send: 3, send: 4}
end
