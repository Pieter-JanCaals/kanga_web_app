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

  def current_tax_rate
    14.976
  end

  def total_no_tax
    order_drinks.map(&:price).sum
  end

  def tax
    total_no_tax * (current_tax_rate / 100)
  end

  def total_with_tax
    total_no_tax + tax
  end

  def grand_total
    total_with_tax * (tip.to_f / 100 + 1)
  end

  def event
    bar.event
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
