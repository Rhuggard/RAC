class Pobject < ActiveRecord::Base
  after_create :create_owner_permission
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def create_owner_permission
    current_id = User.where(:name => 'user2').first
    Policy.create!(:user_id => current_id.id, :action => 'view', :object_id => id)
  end
end
