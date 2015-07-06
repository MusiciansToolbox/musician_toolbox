class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
