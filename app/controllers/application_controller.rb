class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :current_user_order, :require_pending_order

  def current_user_order
    @current_order = current_user && current_user.orders.find_by(status: "pending")
  end

  private

  def require_pending_order
    order = current_user && current_user.orders.find_by(status: "confirmed")
    redirect_to order_url(order) unless order.nil?
    # redirect_to(:root) unless order.nil?
  end
end
