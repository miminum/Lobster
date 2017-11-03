class CreateSellerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_profiles do |t|
      t.references :user, foreign_key: true
      t.string :shop_name
      t.text :shop_photo_data
      t.text :shop_description
      t.text :user_photo_data
      t.string :cuisine_type
      t.integer :delivery_km
      t.integer :delivery_cost

      t.timestamps
    end
  end
end
