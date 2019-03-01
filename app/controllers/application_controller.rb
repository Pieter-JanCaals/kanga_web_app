class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :current_user_order

  def current_user_order
    @current_order = current_user && current_user.orders.find_by(status: "pending")
  end
end
