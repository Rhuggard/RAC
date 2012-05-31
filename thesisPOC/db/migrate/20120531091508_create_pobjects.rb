class CreatePobjects < ActiveRecord::Migration
  def change
    create_table :pobjects do |t|
      t.string :uri

      t.timestamps
    end
  end
end
