class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :create_inverse, unless: :inverse_exists?
  after_destroy :destroy_inverse, if: :inverse_exists?

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
