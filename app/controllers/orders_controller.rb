class OrdersController < ApplicationController
  before_action :set_order

  def show
  end

  def edit
  end

  def update
    raise

  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end

end
