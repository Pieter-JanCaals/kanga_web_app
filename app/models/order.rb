class Order < ApplicationRecord
  belongs_to :bar
  belongs_to :user

  has_many :order_drinks
  has_many :drinks, through: :order_drinks

  validates :status, inclusion: { in: %w[pending confirmed completed],
                                  message: "%{value} is not a valid status" }

  def eta
    drinks.map(&:prep_time).sum
    # order_drinks.map { |order_drink| order}
  end

  def price_no_tip
    drinks.map(&:price).sum
  end
end
