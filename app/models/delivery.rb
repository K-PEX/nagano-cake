class Delivery < ApplicationRecord
  belongs_to :customer
  
  validates :delivery_name,presence:true
  validates :delivery_postal_code,presence:true
  validates :delivery_address,presence:true

  def full_address
    "〒" + self.delivery_postal_code + self.delivery_address + self.delivery_name
  end
end
