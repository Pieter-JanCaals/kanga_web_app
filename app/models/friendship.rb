class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # When a friendship is created (or destroyed) we also want to get the
  # friendship in the other direction. These functions will make an new
  # friendship entry in the database with the inverse friendship.
  # This way we can search friendships based on user_id, disregarding if the
  # current users created the friendship or not.
  after_create :create_inverse, unless: :inverse_exists?
  after_destroy :destroy_inverses, if: :inverse_exists?

  private

  def create_inverse
    self.class.create(inverse_relationship)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def inverse_exists?
    self.class.exists?(inverse_relationship)
  end

  def inverses
    self.class.where(inverse_relationship)
  end

  def inverse_relationship
    { friend_id: user_id, user_id: friend_id }
  end
end
