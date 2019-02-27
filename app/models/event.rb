class Event < ApplicationRecord
  has_many :bars, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
