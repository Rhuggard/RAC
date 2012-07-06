class ApplicationController < ActionController::Base
  before_filter :authorize, :loadQueue
  protect_from_forgery

  protected
 
  def loadQueue
    #Notices: Allows all views to show their particular queue
    #TODO: make it context sensetive: perhaps NoticeQueue.find(session[:user_id])
    @notices = NoticeQueue.all
  end

  def authorize
    if User.find_by_id(session[:user_id])
      @user_name = User.find_by_id(session[:user_id]).name
    else
      redirect_to login_url, notice: 'Please log in'
    end
  end

end
