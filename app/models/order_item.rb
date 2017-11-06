class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def price
    Item.find(item_id).price
  end
end