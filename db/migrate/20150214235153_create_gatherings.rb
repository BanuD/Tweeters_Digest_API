class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.text    :query
      t.integer :user_id
      t.integer :leader_id
      t.string  :leader_handle
      t.integer :relevant_tweets
      t.integer :all_tweets
      t.float   :ratio
      t.string  :phone_number
      t.string  :leader_pic_url

      t.timestamps
    end
  end
end
