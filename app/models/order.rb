class Order < ApplicationRecord
  belongs_to :bar
  belongs_to :user
end
