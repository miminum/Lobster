json.extract! order, :id, :buyer_id, :shop_id, :delivery, :total_price, :charge_identifier, :payment_success, :mark_as_done, :created_at, :updated_at
json.url order_url(order, format: :json)
