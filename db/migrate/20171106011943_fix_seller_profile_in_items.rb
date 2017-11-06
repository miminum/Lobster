class FixSellerProfileInItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :seller_profile_id, :shop_id
  end
end
