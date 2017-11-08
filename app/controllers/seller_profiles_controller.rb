class SellerProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop 
  
  def index
    @items = Item.where(shop: @shop)
    @orders = Order.order(created_at: :desc)  .where(shop: @shop).where.not(charge_identifier: nil).reverse
  end

  def show
  end

  def new
    # if user already has a profile, redirect them to the edit page if they manually type in '/myprofile/new'
    if current_user.shop
      redirect_to edit_shop_path
    else
      @shop = Shop.new
    end
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user

    if @shop.save
      redirect_to seller_profile_path, notice: 'Congratulations, start cooking!' 
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to seller_profile_path, notice: 'Congratulations, you are now a certified chef!' }
        format.json { render :show, status: :ok, location: shop_path }
      else
        format.html { redirect_to edit_seller_profile }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def set_shop
    @shop = current_user.shop
    
  end

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_description, :shop_photo, :user_photo, :cuisine_type, :delivery_km, :delivery_cost,:shop_photo_data, :user_photo_data, :remove_shop_photo, :remove_user_photo)
  end
  

end
