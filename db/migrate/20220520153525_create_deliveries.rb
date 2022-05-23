class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string   :delivery_postal_code
      t.string   :delivery_address
      t.string   :delivery_name
      t.integer  :customer_id

      t.timestamps
    end
  end
end
