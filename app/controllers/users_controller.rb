class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if user_signed_in?
      @user = current_user
      @orders = @user.orders
      @offers = @user.offers
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to view this page.'
    end
  end
end
