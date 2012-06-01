class AddOwnerToPobjects < ActiveRecord::Migration
  def change
    add_column :pobjects, :owner, :string
  end
end
