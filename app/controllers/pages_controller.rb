class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]
  skip_before_action :require_pending_order

  def splash
    # -- The following line creates a new user as soon as they
    #    reach the splash page if they are not already signed in.
    #    Comment it out if you want to revert to the default
    #    login behavior. --
    sign_in User.create_demo_user unless user_signed_in?
  end

  def notification

  end

  def confirmation_2
    @confirmed_order = current_user.orders.find_by(status: "confirmed")
    @qr = RQRCode::QRCode.new(@confirmed_order.qr_code, size: 2, level: :h)
    if @confirmed_order

      @markers =
        [
          { lng: @confirmed_order.event.longitude, lat: @confirmed_order.event.latitude },
          {
            lng: @confirmed_order.bar.longitude, lat: @confirmed_order.bar.latitude,
            infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: @confirmed_order.bar }),
            image_url: helpers.asset_url('logo.png')
          }
        ]
      @event = @confirmed_order.event
    else
      redirect_to drinks_path
    end
  end
end
