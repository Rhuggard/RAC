class Pobject < ActiveRecord::Base
  after_commit :create_owner_permission
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessor :access 
  def create_owner_permission
    ActiveRecord::Base.logger.debug "*************************************"
    ActiveRecord::Base.logger.debug "self: #{self}"
    ActiveRecord::Base.logger.debug "self.owner: #{self.owner}"
    ActiveRecord::Base.logger.debug "*************************************"
    current_id = User.where(:name => self.owner).first
    Policy.create!(:user_id => current_id.id, :action => 'view', :object_id => id)
  end

  #TODO: Perhaps allow access to nothing in this object until this becomes true?
  def after_initialize
    self.access = false;
  end
public
  def self.check_permission(subject_id,action,pobject_id)
    #only need one 
    Policy.where(:user_id => subject_id,:action => action, :object_id => pobject_id).first 
  end
end
