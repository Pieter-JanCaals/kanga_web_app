class OrdersController < ApplicationController
  before_action :set_order, :set_event

  def show
    @qr = RQRCode::QRCode.new(@order.qr_code, size: 4, level: :h)
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

  def confirm
    @event = @order.bar.event
  end

  def review

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
