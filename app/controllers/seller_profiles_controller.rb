class SellerProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller_profile, only: [:show, :edit, :update]
  
  def show
  end

  def new
    # if user already has a profile, redirect them to the edit page if they manually type in '/myprofile/new'
    if current_user.seller_profile
      redirect_to edit_seller_profile_path
    else
      @seller_profile = SellerProfile.new
    end
  end

  def edit
  end

  def create
    @seller_profile = SellerProfile.new(seller_profile_params)
    @seller_profile.user = current_user

    if @seller_profile.save
      redirect_to seller_profile_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @seller_profile.update(seller_profile_params)
        format.html { redirect_to seller_profile_path, notice: 'Congratulations, you are now a certified chef!' }
        format.json { render :show, status: :ok, location: seller_profile_path }
      else
        format.html { render :edit }
        format.json { render json: @seller_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def set_seller_profile
    @seller_profile = current_user.seller_profile
  end

  def seller_profile_params
    params.require(:seller_profile).permit(:shop_name, :shop_description, :shop_photo, :user_photo, :cuisine_type, :delivery_km, :delivery_cost,:shop_photo_data, :user_photo_data, :remove_shop_photo, :remove_user_photo)
  end
  

end
