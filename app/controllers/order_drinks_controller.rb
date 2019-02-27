class OrderDrinksController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    OrderDrink.create(order: @order, drink: Drink.find(params[:drink_id]))

    # respond_to do |format|
    #   format.js { render 'drinks/index' }
    # end
    redirect_to event_drinks_path(@order.bar.event)
  end

  def destroy
    OrderDrink.find(params[:order_drink_id]).destroy
    redirect_to event_drinks_path(Order.find(params[:order_id]).bar.event)
  end
end
