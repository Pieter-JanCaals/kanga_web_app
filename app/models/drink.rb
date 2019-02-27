class Drink < ApplicationRecord
  belongs_to :category
  has_many :order_drinks
  has_many :bar_drinks

  monetize :price_cents
end
