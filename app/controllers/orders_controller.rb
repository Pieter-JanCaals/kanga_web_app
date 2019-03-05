class OrdersController < ApplicationController
  before_action :set_order, :set_event

  def show
    @qr = RQRCode::QRCode.new(@order.qr_code, size: 2, level: :h)
    @bar = @event.closest_bar
    @drinks = @order.drinks
    @markers =
      [
        { lng: @event.longitude, lat: @event.latitude },
        {
          lng: @bar.longitude, lat: @bar.latitude,
          infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: @bar }),
          image_url: helpers.asset_url('logo.png')
        }
      ]
  end

  def update
    @order.status = "confirmed"
    @order.qr_code = DateTime.now.strftime('%Q')
    @order.update(order_params)
    redirect_to order_path(@order) if @order.save
  end
  
  def complete
    @order.status = "completed"
    @order.save
    redirect_to event_drinks_path(@event)
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
