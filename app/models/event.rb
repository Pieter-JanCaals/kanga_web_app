class Event < ApplicationRecord
  has_many :bars
  has_many :drinks, through: :bars
end
