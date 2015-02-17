class CreateCollectors < ActiveRecord::Migration
  def change
    create_table :collectors do |t|
      t.text    :query
      t.integer :user_id
      t.integer :leader_id

      t.timestamps
    end
  end
end



