class Event < ApplicationRecord
  has_many :bars, dependent: :destroy
  has_many :best_sellers

  mount_uploader :photo, PhotoUploader
  mount_uploader :logo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def closest_bar
    bars.first
  end

  def coordinates
    coordinates = [{ lng: longitude, lat: latitude }]
    pry
    coordinates << closest_bar.coordinates
    coordinates << bars.map(&:coordinates)
    coordinates.uniq
  end

  def popular_drinks
    best_sellers.map(&:drink)
    # snippet of code to be used if we add update pouplar drinks logic
    # where(drink: "drink", event: event).exists?
  end
end
