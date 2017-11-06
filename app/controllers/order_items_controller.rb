class OrderItemsController < ApplicationController
  def create
    params[:order][:order_items].each do |key, value|
      if value[:quantity]
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = key
        @order_item.quantity = value[:quantity].to_i
        @order_item.save
      end
    end
  end
end
