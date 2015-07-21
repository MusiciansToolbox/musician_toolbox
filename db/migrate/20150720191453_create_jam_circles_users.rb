class CreateJamCirclesUsers < ActiveRecord::Migration
  def change
    create_table :jam_circles_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :jam_circle, index: true, foreign_key: true
    end
  end
end
