class CreateJamCircles < ActiveRecord::Migration
  def change
    create_table :jam_circles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :public
      t.boolean :open

      t.timestamps null: false
    end
  end
end
