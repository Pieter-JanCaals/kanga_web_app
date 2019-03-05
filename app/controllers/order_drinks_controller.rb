class OrderDrinksController < ApplicationController
  def create
    order = Order.find(params[:order_id])
    drink = Drink.find(params[:drink_id])
    order_drink = OrderDrink.new(amount: params[:order_drink][:amount])
    order_drink.order = order
    order_drink.drink = drink
    order_drink.save!

    if params[:category].present?
      @title = Category.find(params[:category]).name
      @drinks = Drink.where(category_id: params[:category])
    else
      @title = "Popular Drinks"
      @drinks = Drink.all
    end
  end

  def update
    order_drink = OrderDrink.find(params[:id])
    order = order_drink.order
    order_drink.amount = params[:order_drink][:amount]
    order_drink.save!

    if request_from_checkout?
      @title = "Checkout"
      @drinks = order.drinks
    else
      if params[:category].present?
        @title = Category.find(params[:category]).name
        @drinks = Drink.where(category_id: params[:category])
      else
        @title = "Popular Drinks"
        @drinks = Drink.all
      end
    end
  end

  def delete
    OrderDrink.find(params[:order_drink_id]).destroy
    redirect_to event_drinks_path(Order.find(params[:order_id]).bar.event)
  end

  private

  def order_drink_params
    params.require(:order_drink).permit[:amount]
  end

  def request_from_checkout?
    request.referrer.match /\/orders\/\d+$/
  end
end
