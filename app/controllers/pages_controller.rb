class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]

  def splash

  end
  def notification
    confirmed_order = current_user.orders.find_by(status: "confirmed")
    @qr = RQRCode::QRCode.new(confirmed_order.qr_code, size: 2, level: :h)
    if confirmed_order

      @markers =
        [
          { lng: confirmed_order.event.longitude, lat: confirmed_order.event.latitude },
          {
            lng: confirmed_order.bar.longitude, lat: confirmed_order.bar.latitude,
            infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: confirmed_order.bar }),
            image_url: helpers.asset_url('logo.png')
          }
        ]
    else
      redirect_to drinks_path
    end
  end
end
