class AdminController < ApplicationController
  before_filter :authorize
  
  def index
    @notice_queue = NoticeQueue.new 
  end

end
