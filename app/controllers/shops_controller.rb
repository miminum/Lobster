class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: [:show, :edit, :update]
  
  

  def index
    redirect_to new_profile_path if current_user.profile.nil?
    
    # if params[:term]
    #   @shops = Shop.search(params[:term])
    if params[:filter].blank? && params[:term].blank?
      @shops = Shop.active_items
    elsif params[:filter] && params[:term].blank?
      @shops = Shop.filter_by(params[:filter], current_user)
    elsif params[:term] && params[:filter].blank?
      @shops = Shop.search(params[:term])
    elsif params[:term] && params[:filter]
      @shops = Shop.filter_search_by(params[:term], params[:filter], current_user)
    else
      @shops = Shop.active_items
    end
  end

  def show
    @items = Item.where(shop: @shop, active: true)
    @order = Order.new
  end

  def new
    # if user already has a profile, redirect them to the edit page if they manually type in '/myprofile/new'
    if current_user.shop
      redirect_to edit_shop_path(current_user.shop), notice: "Don't be greedy!"
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
        format.html { redirect_to @shop, notice: 'Shop Edited Succesfully' }
        format.json { render :show, status: :ok, location: shop_path }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:filter, :shop_name, :shop_description, :shop_photo, :user_photo, :cuisine_type, :delivery_km, :delivery_cost,:shop_photo_data, :user_photo_data, :remove_shop_photo, :remove_user_photo, :term)
  end


end
