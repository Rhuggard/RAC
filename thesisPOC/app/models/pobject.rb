class Pobject < ActiveRecord::Base
  after_create :create_owner_permission
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def create_owner_permission
    current_id = User.where(:name => 'user2').first
    Policy.create!(:user_id => current_id.id, :action => 'view', :object_id => id)
  end
public
  def self.check_permission(subject_id,action,pobject_id)
    #only need one 
    Policy.where(:user_id => subject_id,:action => action, :object_id => pobject_id).first 
  end
end
