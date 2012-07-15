class NoticeQueue < ActiveRecord::Base
  after_commit :update_permissions
  
  public
  def sender_name
    if self.sender_id
      User.find(self.sender_id).name
    else
      'none'
    end
  end

  def object_name
    'File-' + self.object_id.to_s + ':' + Pobject.find(self.object_id).avatar_file_name
  end
  private
  def update_permissions
    #TODO: Ideally this should check to see if the owner has the ability to perform delegation.
    if self.request == 'false' && self.response == 'yes'
      Policy.create!(:user_id => self.user_id, :action => self.action, :object_id => self.object_id)
    end
  end
end
