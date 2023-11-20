class OrdersController < ApplicationController
  def index

  end

  def show
    @offer = Offer.find(params[:offer_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.offer = @restaurant
    @order.save
    redirect_to root_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    # Below instead should redirect to user's index page
    redirect_to root_path, status: :see_other
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end
