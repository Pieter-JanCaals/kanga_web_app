class OrdersController < ApplicationController
  skip_before_action :require_pending_order, only: [:show, :complete, :summary]
  before_action :set_order, :set_event

  def show
    @qr = RQRCode::QRCode.new(@order.qr_code, size: 2, level: :h)
    @bar = @event.closest_bar
    @drinks = @order.drinks
    @markers =
      [
        {
          lng: @event.longitude,
          lat: @event.latitude,
          image_url: helpers.asset_url('map_user_icon.png')
        },
        {
          lng: @bar.longitude, lat: @bar.latitude,
          infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: @bar }),
          image_url: helpers.asset_url('map_closest_bar_icon.png')
        }
      ]
  end

  def update
    confirmed_at = DateTime.now
    @order.status = "confirmed"
    @order.qr_code = confirmed_at.strftime('%Q')
    @order.confirmed_at = confirmed_at.to_s
    @order.update(order_params)
    redirect_to order_path(@order) if @order.save
  end

  def complete
    @order.status = "completed"
    @order.save
    redirect_to event_drinks_path(@event)
  end

  def summary
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_event
    @event = @order.event
  end

  def order_params
    params.require(:order).permit(:tip)
  end
end
