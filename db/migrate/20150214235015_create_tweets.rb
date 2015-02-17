class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text     :content
      t.integer  :gathering_id
      t.string   :tweet_id

      t.timestamps
    end
  end
end
