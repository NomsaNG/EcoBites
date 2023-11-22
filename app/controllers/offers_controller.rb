class OffersController < ApplicationController
  before_action :set_offer, only: [:show]
  before_action :authenticate_user!, only: [:new]

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @order = Order.new
  end

  def new
    if user_signed_in?
      if current_user.address.present?
        @offer = Offer.new
      else
        redirect_to edit_user_registration_path, alert: 'Please add an address to your shop to be able to create an offer.'
      end
    else
      redirect_to new_user_registration_path, alert: 'Please sign up or sign in to create an offer.'
    end
  end


  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to root_path, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:shop, :title, :description, :quantity, :unit_price, :pickup_instructions, :photo, :pickup_time_start, :pickup_time_end)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
