class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :clip_id
      t.boolean :positive

      t.timestamps null: false
    end
  end
end
