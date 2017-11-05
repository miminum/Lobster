json.extract! listing, :id, :date, :open, :close, :item_id, :quantity, :seller_profile_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
