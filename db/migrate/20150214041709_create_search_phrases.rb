class CreateSearchPhrases < ActiveRecord::Migration
  def change
    create_table :search_phrases do |t|

      t.timestamps
    end
  end
end
