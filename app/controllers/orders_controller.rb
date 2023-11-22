class OrdersController < ApplicationController
  def index
    # I will need to know who the user is to show all of his/her orders
    @user = current_user
    @orders = @user.orders
  end

  def show
    @offer = Offer.find(params[:offer_id])
  end

  def create
    # I will need to know who the user is to link the new order to him/her
    @offer = Offer.find(params[:offer_id])
    @order = Order.new(order_params)
    @order.offer = @offer
    @order.user = current_user

    if @order.save
      redirect_to root_path, notice: "Order successfully created."
    else
      render 'offers/show', alert: "Failed to create order."
    end
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
