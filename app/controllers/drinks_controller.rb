class DrinksController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    bar = closest_bar(@event)
    @categories = bar.drinks.map(&:category).uniq
    if params[:category].present?
      @title = Category.find(params[:category]).name
      @drinks = bar.drinks.where(category_id: params[:category])
    else
      @title = "Popular Drinks"
      @drinks = popular_drinks(bar.drinks)
    end

    @current_order = Order.find_by(user: current_user, status: "pending") || new_order(bar)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def closest_bar(event)
    # logic to find closest bar to user
    event.bars.first
  end

  def popular_drinks(drinks)
    # logic to determine popular drinks
    drinks
  end

  def new_order(bar)
    Order.create(user: current_user, bar: bar, status: 'pending', qr_code: "qr_code")
  end
end
