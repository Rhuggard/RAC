class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected

  def authorize
    if User.find_by_id(session[:user_id])
      @user_name = User.find_by_id(session[:user_id])
    else
      redirect_to login_url, notice: 'Please log in'
    end
  end

end
