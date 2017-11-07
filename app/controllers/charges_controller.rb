class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  
  def new
  end
    
  def create
    # Amount in cents
    @amount = (@order.total_price * 100).to_i
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'aud'
    )
    
    @order.charge_identifier = charge.id
    @order.save
    redirect_to order_path(@order) if @order.save

    rescue Stripe::CardError => e
        flash[:error] = e.message
    
  end

  private
  def set_order
    @order = Order.find(params[:order_id])
  end
end
