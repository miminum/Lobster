class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  
  def show
  end

  def new
    # if user already has a profile, redirect them to the edit page if they manually type in '/myprofile/new'
    if current_user.profile
      redirect_to edit_profile_path
    else
      @profile = Profile.new
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :street_address, :suburb, :state, :user_id)
  end
end
