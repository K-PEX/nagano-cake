class AddCustomerIdToDeriverlies < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :customer_id, :integer, null: false
  end
end
