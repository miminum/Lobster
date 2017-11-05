class LandingController < ApplicationController
  def index
    @todays_listings = Listing.where(date: Date.today)
    
  end
end
