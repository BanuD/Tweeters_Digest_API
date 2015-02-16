class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string  :twitter_object
      t.integer :user_id

      t.timestamps
    end
  end
end
