class LandingPageController < ApplicationController
  skip_before_filter :authorize
  def index
    #Create an emptey user object in case a user wishes to sign-up from
    # the landing page
    @user = User.new
  end

end
