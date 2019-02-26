class Bar < ApplicationRecord
  belongs_to :event
  has_many :orders
  has_many :bar_drinks, dependent: :destroy
  has_many :drinks, through: :bar_drinks
end
