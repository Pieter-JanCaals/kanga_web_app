class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]

  def splash
    # -- The following line creates a new user as soon as they
    #    reach the splash page if they are not already signed in.
    #    Comment it out if you want to revert to the default
    #    login behavior. --
    sign_in User.create_demo_user unless user_signed_in?
  end
end
