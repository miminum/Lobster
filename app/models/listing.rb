class Listing < ApplicationRecord
  belongs_to :item
  belongs_to :seller_profile

  def seller_profile
    SellerProfile.find(seller_profile_id)
  end
end
