class Event < ApplicationRecord
  has_many :bars, dependent: :destroy

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

  def close_tabs
    bars.each do |bar|
      tab = bar.close_tabs
      tab.each { |k, v| tabs[k] += v }
    end
    binding.pry
    tabs.each do |k, v|
      puts "#{User.find(k).name} has to pay #{v}"
    end
  end
end
