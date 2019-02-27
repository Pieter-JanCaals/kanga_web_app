class Order < ApplicationRecord
  belongs_to :bar
  belongs_to :user

  has_many :order_drinks
  has_many :drinks, through: :order_drinks

  validates :status, inclusion: { in: %w[pending confirmed completed],
                                  message: "%{value} is not a valid status" }

  def eta
    order_drinks.map(&:eta).sum
  end

  def price_no_tip
    order_drinks.map(&:price).sum
  end

  def self.pending
    where(status: "pending")
  end

  def self.confirmed
    where(status: "confirmed")
  end

  def self.completed
    where(status: "completed")
  end
end
