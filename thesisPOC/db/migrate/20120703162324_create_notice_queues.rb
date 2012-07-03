class CreateNoticeQueues < ActiveRecord::Migration
  def change
    create_table :notice_queues do |t|
      t.integer :user_id
      t.string :action
      t.integer :object_id
      t.string :message
      t.string :request

      t.timestamps
    end
  end
end
