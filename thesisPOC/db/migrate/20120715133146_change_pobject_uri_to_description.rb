class ChangePobjectUriToDescription < ActiveRecord::Migration
  def change
    rename_column :pobjects, :uri, :description
  end
end
