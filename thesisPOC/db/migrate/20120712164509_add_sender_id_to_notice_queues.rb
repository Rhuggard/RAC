class AddSenderIdToNoticeQueues < ActiveRecord::Migration
  def change
    add_column :notice_queues, :sender_id, :integer
  end
end
