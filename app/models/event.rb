class Event < ApplicationRecord
  has_many :bars, dependent: :destroy

  mount_uploader :photo, PhotoUploader

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
end
