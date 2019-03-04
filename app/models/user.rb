class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  # -- This is called if line 9 in pages_controller.rb is active.
  #    It creates a new user as soon as they reach the splash
  #    page if they are not already signed in. --
  def self.create_demo_user
    User.create(
      email: "demouser#{rand(1_000_000)}@kanga.life",
      password: "lewagon#{rand(1_000_000)}"
    )
  end
end
