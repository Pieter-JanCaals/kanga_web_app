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

  def close_tabs
    tabs_per_user = Hash.new(0)

    array = orders.map(&:close_tabs)
    array.each do |element|
      element.each { |k, v| tabs_per_user[k] += v }
    end

    return tabs_per_user
  end
end
