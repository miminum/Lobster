class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def price
    Item.find(item_id).price
  end
end