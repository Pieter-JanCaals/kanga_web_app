class OrderDrinksController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    OrderDrink.create(order: @order, drink: Drink.find(params[:drink_id]))

    redirect_to event_drinks_path(@order.bar.event)
  end
end
