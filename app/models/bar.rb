class Bar < ApplicationRecord
  belongs_to :event
  has_many :orders
  has_many :bar_drinks, dependent: :destroy
  has_many :drinks, through: :bar_drinks

  def eta
    orders.where(status: "pending").map(&:eta).sum
  end
end
