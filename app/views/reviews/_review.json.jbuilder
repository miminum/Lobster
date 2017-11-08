json.extract! review, :id, :user_id, :shop_id, :order_id, :content, :score, :created_at, :updated_at
json.url review_url(review, format: :json)
