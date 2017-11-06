class RenameSellerProfileToShop < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :seller_profiles, :shops
  end

  def self.down
    rename_table :shops, :seller_profiles
  end
end
