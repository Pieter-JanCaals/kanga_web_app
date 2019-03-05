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

  def tip_amount
    total_with_tax * (tip.to_f / 100)
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

  def shared_tip
    tip_amount / order_drinks.map(&:id).uniq.size
  end

  # returns a hash with the key = the id of the user and the value = the total amount
  # the user has to pay for this order
  def close_tabs
    if status == "pending"
      # destroy order
    else
      tabs_per_user = Hash.new(0)
      array = order_drinks.map(&:close_tab)
      array.each do |element|
        element.each { |k, v| tabs_per_user[k] += v }
      end

      # set status to paid
      return tabs_per_user
    end
  end
end
