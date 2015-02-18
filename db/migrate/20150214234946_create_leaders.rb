class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string  :twitter_id
      t.string  :handle
      t.string  :screen_name
      t.string  :profile_image_url_https
      t.string  :name
      t.integer :user_id
      t.text    :query, default: ""

      t.timestamps
    end
  end
end
