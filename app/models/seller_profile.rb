class SellerProfile < ApplicationRecord
  include ShopPhotoUploader[:shop_photo]
  include UserPhotoUploader[:user_photo]
  belongs_to :user

  CUISINE_TYPES = ["Chinese", "French", "Italian", "Japanese", "Mexican", "Spanish", "Ethiopian", "Thai", "Africaaaaan", "Vietnamese"]
end
