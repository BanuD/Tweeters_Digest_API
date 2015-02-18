class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.text    :query
      t.integer :user_id
      t.integer :leader_id
      t.string  :leader_handle
      t.integer :relevant_tweets
      t.integer :all_tweets
      t.integer :ratio

      t.timestamps
    end
  end
end



