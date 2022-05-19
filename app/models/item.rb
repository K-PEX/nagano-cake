class Item < ApplicationRecord
   has_one_attached :image

  #validates :image, presence: true
  #validates :name, presence: true
  #validates :introduction, presence: true
  #validates :price, presence: true
  #validates :is_active, presence: true
  #validates :genre, presence: true
end
