params = {"utf8"=>"✓",
"authenticity_token"=>"uZeyLNL+4p5zBP+ewGFxh6NA0QIlBpVsovkoTFbBjbk9/qIZXoTPctGz0b1wJlSNjBOm3ZgqPONnQasMuPQOUA==",
"order"=>{"buyer_id"=>"1", "shop_id"=>"1", "order_items"=>{"1"=>{"quantity"=>"3"}, "2"=>{"quantity"=>"2"}}},
"commit"=>"Order"}

p params[:order][:buyer_id].inspect