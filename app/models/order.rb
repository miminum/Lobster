class Order < ApplicationRecord
  belongs_to :buyer, :foreign_key => :buyer_id, class_name: 'User'
  belongs_to :shop
  has_many :order_items

  def delivery_price
    if delivery
      Shop.find(shop_id).delivery_cost
    else
      0
    end
  end

  def subtotal
    sum = self.delivery_price
    OrderItem.where(order: self).each do |item|
      sum += item.quantity * item.price
    end
    sum
  end

  def order_date
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end

  def order_time
    created_at.strftime("%l:%M %p")
  end
end
