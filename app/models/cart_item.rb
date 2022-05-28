class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :amount, presence: true, numericality: true
  
  def subtotal
    item.add_tax_price * amount
  end
end
