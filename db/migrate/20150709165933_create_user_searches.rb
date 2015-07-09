class CreateUserSearches < ActiveRecord::Migration
  def change
    create_table :user_searches do |t|
      t.integer :searcher_id
      t.integer :zipcode
      t.boolean :default_search
      t.integer :instrument_id
      t.integer :genre_id
      t.text :results

      t.timestamps null: false
    end
  end
end
