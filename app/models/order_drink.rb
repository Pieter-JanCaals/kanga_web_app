class OrderDrink < ApplicationRecord
  belongs_to :order
  belongs_to :drink
  belongs_to :user

  def eta
    drink.prep_time * amount
  end

  def price
    drink.price * amount
  end

  def close_tab
    Hash[user.id, (drink.price * amount) + order.shared_tip]
    # { user.id.to_s.to_sym => (drink.price * amount) + order.shared_tip }
  end
end
