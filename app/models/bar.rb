class Bar < ApplicationRecord
  belongs_to :event
  has_many :orders
  has_many :bar_drinks, dependent: :destroy
  has_many :drinks, through: :bar_drinks

  def eta
    orders.where(status: "confirmed").map(&:eta).sum
  end

  def coordinates
    {
      lng: longitude,
      lat: latitude,
      infoWindow: name,
      image_url: helpers.asset_url('logo.png')
    }
  end

  def users
    orders.
  end
end
