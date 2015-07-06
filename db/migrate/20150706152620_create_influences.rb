class CreateInfluences < ActiveRecord::Migration
  def change
    create_table :influences do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
