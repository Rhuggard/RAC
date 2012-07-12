class AddResponseToNoticeQueues < ActiveRecord::Migration
  def change
    add_column :notice_queues, :response, :string
  end
end
