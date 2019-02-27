class Order < ApplicationRecord
  belongs_to :bar
  belongs_to :user

  has_many :order_drinks
  has_many :drinks, through: :order_drinks

  monetize :price_cents
end
