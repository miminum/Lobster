class Shop < ApplicationRecord
  include ShopPhotoUploader[:shop_photo]
  include UserPhotoUploader[:user_photo]
  belongs_to :user
  has_many :item
  validates_presence_of :shop_name, :cuisine_type
  validates :delivery_cost, numericality: { greater_than_or_equal_to: 0, less_than: 20 }
  
  CUISINE_TYPES = ["Continental", "Chinese", "French", "Italian", "Japanese", "Mexican", "Spanish", "Ethiopian", "Thai", "African", "Vietnamese"]
end