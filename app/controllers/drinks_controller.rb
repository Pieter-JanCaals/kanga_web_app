class DrinksController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    cl_bar = closest_bar(@event)
    @categories = cl_bar.drinks.map(&:category).uniq
    if params[:category].present?
      @title = Category.find(params[:category]).name
      @drinks = cl_bar.drinks.where(category_id: params[:category])
    else
      @title = "Popular Drinks"
      @drinks = @event.popular_drinks
    end


    @current_order = Order.find_by(user: current_user, status: "pending") || new_order(cl_bar)
    @bars = [
      {
        lng: @event.longitude,
        lat: @event.latitude,
        image_url: helpers.asset_url('map_user_icon.png')
      }
    ]
    @bars << {
      lng: cl_bar.longitude,
      lat: cl_bar.latitude,
      infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: cl_bar }),
      image_url: helpers.asset_url('map_closest_bar_icon.png')
    }
    @event.bars.each do |bar|
      unless bar == cl_bar
        @bars <<
          {
            lng: bar.longitude,
            lat: bar.latitude,
            infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: bar }),
            image_url: helpers.asset_url('map_normal_bar_icon.png')
          }
        end
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

  # def popular_drinks(drinks)
  #   logic to determine popular drinks
  #   drinks
  # end

  def new_order(bar)
    Order.create(user: current_user, bar: bar, status: 'pending', qr_code: "qr_code")
  end
end
