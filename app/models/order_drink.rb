class OrderDrink < ApplicationRecord
  belongs_to :order
  belongs_to :drink

  after_save :destroy_if_empty

  def eta
    drink.prep_time * amount
  end

  def price
    drink.price * amount
  end

  def event_best_sellers
    order.bar.event.popular_drinks
  end

  private

  def destroy_if_empty
    destroy if amount.zero?
  end
end
