class ApplicationController < ActionController::Base
  before_filter :authorize, :loadQueue
  protect_from_forgery

  protected
 
  def loadQueue
    #Notices: Allows all views to show their particular queue
    @notices = NoticeQueue.all
    @my_notices = get_my_notices(@notices)
    @my_replies = get_my_replies(@notices)
  end

  def get_my_replies(notices)
    my_replies = Array.new
  
    user = User.find_by_id(session[:user_id])
    unless user.nil?
      notices.each do |notice|
        #TODO: fix identifying users by name
        # The subject ID will be the sender and so if we are the subject ID and there has been a response then it is for us. 
        if notice.user_id == user.id && !(notice.response.blank?)
          my_replies.push notice
          ActiveRecord::Base.logger.debug "***** pushing reply : #{notice}"
        else
          ActiveRecord::Base.logger.debug "***** ignoring reply: #{notice}"
        end
      end
    end
    my_replies
  end


  def get_my_notices(notices)
    my_notices = Array.new
    #TODO: fix logging
    ActiveRecord::Base.logger.debug "*************************************"
    ActiveRecord::Base.logger.debug "*           Get My Notices          *"
    ActiveRecord::Base.logger.debug "*************************************"
    ActiveRecord::Base.logger.debug "Pobject: #{Pobject}"
   
    user = User.find_by_id(session[:user_id])
    #If session gets mussed up (should only happen in dev) this could be nil
    if user.nil?
    ActiveRecord::Base.logger.debug "Warning: User is nil this session is in the twilight zone"
    else
      notices.each do |notice|
      ActiveRecord::Base.logger.debug "Notice : #{notice}"
      #TODO: DOh, object_id is used internally, need to refactor to pobject_id or the next
      # line will send back the 'object_id' variable rather than the attribute!
      #ActiveRecord::Base.logger.debug "Notice object_id: #{notice.object_id}"
      ActiveRecord::Base.logger.debug "Notice object_id: #{notice.attributes['object_id']}"
      #TODO: clean this up
      #TODO: ensure that it is safe to use user names as opposed to unique ids for this and if not change
      ActiveRecord::Base.logger.debug "owner = #{Pobject.find_by_id(notice.object_id).owner}"
      ActiveRecord::Base.logger.debug "session_id = #{user.name}"
        if Pobject.find_by_id(notice.object_id).owner == user.name && notice.request == 'true'
          my_notices.push notice
          ActiveRecord::Base.logger.debug "***** pushing : #{notice}"
        else
          ActiveRecord::Base.logger.debug "***** ignoring: #{notice}"
        end
      end
    end
    my_notices
  end
        

  def authorize
    if User.find_by_id(session[:user_id])
      @user_id = session[:user_id]
      @user_name = User.find_by_id(session[:user_id]).name
    else
      redirect_to login_url, notice: 'Please log in'
    end
  end

end
