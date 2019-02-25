class OrderDrink < ApplicationRecord
  belongs_to :order
  belongs_to :drink
end
