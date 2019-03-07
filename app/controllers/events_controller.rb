class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @bars = [{ lng: @event.longitude, lat: @event.latitude }]
    @event.bars.each do |bar|
      @bars <<
        {
          lng: bar.longitude,
          lat: bar.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { bar: bar }),
          #image_url: helpers.asset_url('logo.png')
        }
    end
  end
end
