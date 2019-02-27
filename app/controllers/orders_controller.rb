class OrdersController < ApplicationController
  before_action :set_order

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
