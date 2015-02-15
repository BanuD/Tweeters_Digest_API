class CreateCollectors < ActiveRecord::Migration
  def change
    create_table :collectors do |t|
      t.text    :query
      t.string  :user_id
      t.string  :leader_id

      t.timestamps
    end
  end
end
