class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text     :content
      t.integer  :gathering_id
      t.string   :tweet_id
      t.string   :handle
      t.string   :url
      t.string   :leader_pic_url
      t.datetime :tweet_creation_time

      t.timestamps
    end
  end
end
