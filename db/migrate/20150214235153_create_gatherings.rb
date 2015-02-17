class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.text    :query
      t.integer :user_id
      t.integer :leader_id

      t.timestamps
    end
  end
end



