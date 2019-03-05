class OrdersController < ApplicationController
  before_action :set_order, :set_event

  def show
    @qr = RQRCode::QRCode.new(@order.qr_code, size: 2, level: :h)
    bar = @event.closest_bar
    @markers =
      [
        { lng: @event.longitude, lat: @event.latitude },
        {
          lng: bar.longitude, lat: bar.latitude,
          infoWindow: render_to_string(partial: "events/infowindow", locals: { bar: bar }),
          image_url: helpers.asset_url('logo.png')
        }
      ]
  end

  def edit
  end

  def update
    @order.status = "confirmed"
    @order.qr_code = DateTime.now.strftime('%Q')
    @order.update(order_params)
    redirect_to order_path(@order) if @order.save
  end

  def destroy
  end

  def split_tab
    @order_drinks = @order.order_drinks
    @friends = current_user.friends
  end

  def confirm_split_tab
    keys = drinks_by_user_id
    keys.each do |key|
      drink = Drink.find_by(name: key.split(/-\d*/))
      user = User.find(key.match(/-\d*/).to_s.delete("-").to_i)
      amount = params[key].to_i
      OrderDrink.create!(drink: drink, user: user, order: @order, amount: amount)
    end

    drinks_hash = Hash.new(0)
    new_order_drinks = @order.order_drinks.where.not(user: current_user)
    new_order_drinks.each { |order_drink| drinks_hash[order_drink.drink.id] += order_drink.amount }

    original_order_drinks = @order.order_drinks.where(user: current_user)
    original_order_drinks.each do |order_drink|
      order_drink.amount -= drinks_hash[order_drink.drink.id]
      order_drink.save!
    end
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

  def drinks_by_user_id
    keys = params.keys
    2.times { keys.shift }
    4.times { keys.pop }
    return keys
  end
end
