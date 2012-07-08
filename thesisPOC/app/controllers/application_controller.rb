class ApplicationController < ActionController::Base
  before_filter :authorize, :loadQueue
  protect_from_forgery

  protected
 
  def loadQueue
    #Notices: Allows all views to show their particular queue
    #TODO: make it context sensetive: perhaps NoticeQueue.find(session[:user_id])
    @notices = NoticeQueue.all
    @my_notices = get_my_notices(@notices)
  end

  def get_my_notices(notices)
    my_notices = Array.new
    ActiveRecord::Base.logger.debug "*************************************"
    ActiveRecord::Base.logger.debug "*           Get My Notices          *"
    ActiveRecord::Base.logger.debug "*************************************"
    ActiveRecord::Base.logger.debug "Pobject: #{Pobject}"
    notices.each do |notice|
    ActiveRecord::Base.logger.debug "Notice : #{notice}"
    #TODO: DOh, object_id is used internally, need to refactor to pobject_id or the next
    # line will send back the 'object_id' variable rather than the attribute!
    #ActiveRecord::Base.logger.debug "Notice object_id: #{notice.object_id}"
    ActiveRecord::Base.logger.debug "Notice object_id: #{notice.attributes['object_id']}"
    #TODO: clean this up
    #TODO: ensure that it is safe to use user names as opposed to unique ids for this and if not change
    ActiveRecord::Base.logger.debug "owner = #{Pobject.find_by_id(notice.object_id).owner}"
    ActiveRecord::Base.logger.debug "session_id = #{User.find_by_id(session[:user_id]).name}"
      if Pobject.find_by_id(notice.object_id).owner == User.find_by_id(session[:user_id]).name
        my_notices.push notice
        ActiveRecord::Base.logger.debug "***** pushing : #{notice}"
      else
        ActiveRecord::Base.logger.debug "***** ignoring: #{notice}"
      end
    end
    my_notices
  end
        

  def authorize
    if User.find_by_id(session[:user_id])
      @user_name = User.find_by_id(session[:user_id]).name
    else
      redirect_to login_url, notice: 'Please log in'
    end
  end

end
