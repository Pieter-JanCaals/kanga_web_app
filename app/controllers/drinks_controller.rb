class DrinksController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    bar = closest_bar(@event)
    @categories = bar.drinks.map(&:category).uniq
    if params[:category].present?
      @category = Category.find(params[:category])
      @drinks = bar.drinks.where(category: @category)
    else
      @drinks = popular_drinks(bar.drinks)
    end

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
end
