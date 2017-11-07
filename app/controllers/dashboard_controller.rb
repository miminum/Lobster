class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.where(buyer: current_user)
    @profile = current_user.profile
  end
end
