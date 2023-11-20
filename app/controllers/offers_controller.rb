class OffersController < ApplicationController
  before_action :set_offer, only: [:show]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :quantity, :unit_price, :pickup_time_start, :pickup_time_end, :pickup_instructions, :picture)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
