class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string  :name
      t.string  :nickname
      t.string  :image
      t.string  :user_id

      t.timestamps
    end
  end
end
