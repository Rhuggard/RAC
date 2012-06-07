class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.integer :user_id
      t.string :action
      t.integer :object_id

      t.timestamps
    end
  end
end
