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

    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path

    @order.update_attribute(:charge_identifier, charge.id) 
    @order.save

    redirect_to orders_path
  end

  private
  def set_order
    @order = Order.find(params[:order_id])
  end
end
