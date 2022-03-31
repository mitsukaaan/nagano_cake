class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment_method,default:0
      t.integer :total_price
      t.integer :postage
      t.integer :status,default:0

      t.timestamps
    end
  end
end
