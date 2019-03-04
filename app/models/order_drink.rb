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
end
