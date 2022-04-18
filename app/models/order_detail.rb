class OrderDetail < ApplicationRecord
    belongs_to:order
    belongs_to:item
    enum making_status: {not_make:0, make_wait:1, make_now:2, make_done:3}
end
