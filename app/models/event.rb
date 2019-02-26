class Event < ApplicationRecord
  has_many :bars

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
