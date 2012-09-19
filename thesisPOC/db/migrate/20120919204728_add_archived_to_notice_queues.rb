class AddArchivedToNoticeQueues < ActiveRecord::Migration
  def change
    add_column :notice_queues, :archived, :boolean
  end
end
